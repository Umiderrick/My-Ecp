package pb;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DbConfig {
	private static Properties config = null;
	static {
		config = new Properties();
		try (InputStream in = new FileInputStream("C:/Users/umiderrick/git/My-Ecp/src/DBconfig.properties")){
			config.load(in);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	// ¸ù¾Ýkey¶ÁÈ¡value
	public static String readValue(String key) {
		return config.getProperty(key);
	}

}