import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import java.io.StringReader;
import java.util.List;

public class MovieCsvParser {
    public static void main(String[] args) throws Exception {
        // Your input string (note: the \" in your original is just Java's way of escaping quotes in a string literal)
        String csvRecord = "2021-12-15,Spider-Man: No Way Home,\"Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.\",5083.954,8940,8.3,en,\"Action, Adventure, Science Fiction\",https://image.tmdb.org/t/p/original/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg";

        // Configure the parser to handle standard CSV formatting
        CSVParser csvParser = new CSVParserBuilder()
                .withSeparator(',')
                .withQuoteChar('"')
                .build();

        // Read the single record from the string
        try (CSVReader reader = new CSVReaderBuilder(new StringReader(csvRecord))
                .withCSVParser(csvParser)
                .build()) {

            List<String[]> parsedRecords = reader.readAll();
            String[] fields = parsedRecords.get(0);

            // Map parsed fields to meaningful variables
            String releaseDate = fields[0];
            String title = fields[1];
            String overview = fields[2];
            double worldwideGross = Double.parseDouble(fields[3]);
            int voteCount = Integer.parseInt(fields[4]);
            double rating = Double.parseDouble(fields[5]);
            String originalLanguage = fields[6];
            String genres = fields[7];
            String posterUrl = fields[8];

            // Example output to verify
            System.out.printf("Title: %s%n", title);
            System.out.printf("Release Date: %s%n", releaseDate);
            System.out.printf("Genres: %s%n", genres);
            System.out.printf("Rating: %.1f/10 (from %d votes)%n", rating, voteCount);
        }
    }
}