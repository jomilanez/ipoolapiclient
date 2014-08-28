package de.asideas.ipool;

import oauth.signpost.OAuthConsumer;
import oauth.signpost.commonshttp.CommonsHttpOAuthConsumer;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.AllowAllHostnameVerifier;
import org.apache.http.impl.client.DefaultHttpClient;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.io.File;
import java.io.FileInputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyStore;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.PKIXParameters;
import java.security.cert.X509Certificate;

/**
 * Created by jmilanez on 28.08.14.
 */


public class APIClient {

	public static void main(String args[]) throws Exception {

		// create a consumer object and configure it with the access
		// token and token secret obtained from the service provider
		OAuthConsumer consumer = new CommonsHttpOAuthConsumer("oauth-key", "oauth-secret");
		consumer.setTokenWithSecret("", "");

		// create an HTTP request to a protected resource
		HttpGet request = new HttpGet("http://pideas-ipool02.asv.local:9090/api/v3/related");

		// sign the request
		consumer.sign(request);

		// send the request
		HttpClient httpClient = new DefaultHttpClient();
		HttpResponse response = httpClient.execute(request);

		System.out.println(response.getEntity().toString());
	}


}
