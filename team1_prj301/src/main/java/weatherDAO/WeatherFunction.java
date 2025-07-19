package weatherDAO;

//retrieve weather data from api - this backend logic will fetch the latest weather
//data from the external API and return it
//the GUI will display this data to user
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;
import org.json.simple.parser.ParseException;

public class WeatherFunction {

    //fetch weather data from given location
    public static JSONObject getWeatherData(String locationName) {
        //get location coordinates using the geolocation API
        JSONArray locationData = getLocationData(locationName);

        //extract latitude and longitude data
        //get(0) because the first stored object is usually the place we are looking for
        JSONObject location = (JSONObject) locationData.get(0);

        //we must cast the type whenever getting a value from the JSONObject
        Double latitude = (double) location.get("latitude");
        Double longitude = (double) location.get("longitude");

        //build API request URL with location coordinates
        String urlString = "https://api.open-meteo.com/v1/forecast?"
                + "latitude=" + latitude + "&longitude=" + longitude
                + "&hourly=temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m&timezone=Asia%2FBangkok&forecast_days=3";
        try {
            //call api and get response
            HttpURLConnection conn = fetchApiResponse(urlString);

            //check for result code
            if (conn.getResponseCode() != 200) {
                System.out.println("Error: Could not connect to API");
                return null;
            }

            //store resulting json data
            StringBuilder resultJson = new StringBuilder();
            try (Scanner sc = new Scanner(conn.getInputStream())) {
                if (sc.hasNext()) {
                    //read and store into the string builder
                    resultJson.append(sc.nextLine());
                }
                //close scanner
            }

            //close url connection
            conn.disconnect();

            //parse through the data
            JSONParser parser = new JSONParser();
            //resultJson is only a string so we need to parse it in order to
            //use data properly
            JSONObject resultJsonObject = (JSONObject) parser.parse(String.valueOf(resultJson));

            //retrieve hourly data
            JSONObject hourly = (JSONObject) resultJsonObject.get("hourly");

            //to get the current hour's data we need to get the index of the current time
            JSONArray time = (JSONArray) hourly.get("time");
            int index = findIndexOfCurrentTime(time);

            //get temperature
            JSONArray temperatureData = (JSONArray) hourly.get("temperature_2m");
            double temperature = (double) temperatureData.get(index);

            //get weather code
            // is used to find weather description (cloudy, rain,...)
            JSONArray weatherCode = (JSONArray) hourly.get("weather_code");
            String weatherCondition = convertWeatherCondition((long) weatherCode.get(index));

            //get humidity
            JSONArray relativeHumidity = (JSONArray) hourly.get("relative_humidity_2m");
            long humidity = (long) relativeHumidity.get(index);

            //get windspeed
            JSONArray windspeedData = (JSONArray) hourly.get("wind_speed_10m");
            double windspeed = (double) windspeedData.get(index);

            //build the weather json data object that we are going to access in our frontend
            JSONObject weatherData = new JSONObject();
            weatherData.put("temperature", temperature);
            weatherData.put("weather_condition", weatherCondition);
            weatherData.put("humidity", humidity);
            weatherData.put("windspeed", windspeed);

            return weatherData;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //convert the weather code to something more readable
    private static String convertWeatherCondition(long weatherCode) {
        String weatherCondition = "";
        if (weatherCode == 0L) {
            weatherCondition = "Clear";
        } else if (weatherCode <= 3L && weatherCode > 1L) {
            weatherCondition = "Cloudy";
        } else if ((weatherCode >= 51L && weatherCode <= 67L) || (weatherCode >= 80L && weatherCode <= 99L)) {
            weatherCondition = "Rainy";
        } else if (weatherCode >= 71L && weatherCode <= 77L) {
            weatherCondition = "Snow";
        }
        return weatherCondition;
    }

    //retrieve geographic coordinates from given location name
    public static JSONArray getLocationData(String locationName) {
        //replace any whitespace in location name to "+" to adhere to API's request format
        locationName = locationName.replaceAll(" ", "+");

        //build API url with location parameter
        String urlString = "https://geocoding-api.open-meteo.com/v1/search?name="
                + locationName + "&count=10&language=en&format=json";
        try {
            //call api and get a response
            HttpURLConnection conn = fetchApiResponse(urlString);

            //check response code, 200 means successful connection
            if (conn.getResponseCode() != 200) {
                System.out.println("Error: could not connect to API");
                return null;
            } else {
                //store API results
                StringBuilder resultJson = new StringBuilder();
                //read and store the resulting json data into the string builder
                try (Scanner sc = new Scanner(conn.getInputStream())) {
                    //read and store the resulting json data into the string builder
                    while (sc.hasNext()) {
                        resultJson.append(sc.nextLine());
                    }
                    //close scanner
                }

                //close url connection
                conn.disconnect();

                //parse the JSON string into a JSOn obj
                JSONParser parser = new JSONParser();
                JSONObject resultsJsonObj = (JSONObject) parser.parse(String.valueOf(resultJson));

                //get the list of location data the API generated from the location name
                JSONArray locationData = (JSONArray) resultsJsonObj.get("results");

                //return location data from the entered place as parameter
                //this will give us the coordinate of the place which is the
                //parameter of the getWeatherData method
                return locationData;
            }
        } catch (IOException | ParseException e) {
            e.printStackTrace();
        }

        //could not find the location
        return null;
    }

    private static HttpURLConnection fetchApiResponse(String urlString) {
        try {
            //attempt to create connection
            URL url = new URL(urlString);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //set request method to "GET"
            conn.setRequestMethod("GET");

            //connect to API
            conn.connect();
            return conn;
        } catch (IOException e) {
            e.printStackTrace();
        }

        //could not make connection
        return null;
    }

    private static int findIndexOfCurrentTime(JSONArray timeList) {
        String currentTime = getCurrentTime();

        //iterate through time list to find which one matches the current time
        for (int i = 0; i < timeList.size(); i++) {
            String time = (String) timeList.get(i);
            if (time.equalsIgnoreCase(currentTime)) {
                //return the index
                return i;
            }
        }
        return 0;
    }

    public static String getCurrentTime() {
        //get current data and time
        LocalDateTime currentDateTime = LocalDateTime.now();

        //format the date to be 2025-02-26T00:00 because this is the request of API
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH':00'");

        //format and print out the current date time
        String formattedDateTime = currentDateTime.format(formatter);

        return formattedDateTime;
    }

    public static void main(String[] args) {
       
        JSONObject weatherData = new JSONObject();
        weatherData = getWeatherData("Da Nang");
        double temperature = (double) weatherData.get("temperature");
        System.out.println(temperature);
    }
}
