package de.asideas.ipool;

import oauth.signpost.OAuthConsumer;
import oauth.signpost.commonshttp.CommonsHttpOAuthConsumer;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import sun.misc.IOUtils;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * Created by jmilanez on 28.08.14.
 */


public class APIClient {

	public static void main(String args[]) throws Exception {

		try {
			SSLContext context = SSLContext.getInstance("SSL");
			context.init(null, trustAllCerts, new SecureRandom());
			HttpsURLConnection.setDefaultSSLSocketFactory(context.getSocketFactory());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (KeyManagementException e) {
			e.printStackTrace();
		}

		// create a consumer object and configure it with the access
		// token and token secret obtained from the service provider
		OAuthConsumer consumer = new CommonsHttpOAuthConsumer("oauth-key", "oauth-secret");
		consumer.setTokenWithSecret("", "");

		// create an HTTP request to a protected resource
		HttpGet request = new HttpGet("https://ipool.s.asideas.de/api/v3/search");

		// sign the request
		consumer.sign(request);

		// send the request
		HttpClient httpClient = new DefaultHttpClient();
		HttpResponse response = httpClient.execute(request);

		String responseBody = EntityUtils.toString(response.getEntity());

		System.out.println(responseBody);

	}

	private static TrustManager[] trustAllCerts = new TrustManager[] {
		new X509TrustManager() {
			public X509Certificate[] getAcceptedIssuers() {
				return null;
			}

			@Override
			public void checkClientTrusted(X509Certificate[] chain,
				String authType) throws CertificateException {
				// TODO Auto-generated method stub

			}

			@Override
			public void checkServerTrusted(X509Certificate[] chain,
				String authType) throws CertificateException {
				// TODO Auto-generated method stub

			}

		}
	};

}
