ipoolapiclient
==============

Adding the certificate in your keystore

1. Import a trusted certificate and generate a truststore file keytool -import -alias "my server cert" -file server.crt -keystore my.truststore

2. Generate a new key (use the same password as the truststore) keytool -genkey -v -alias "my client key" -validity 365 -keystore my.keystore

3. Issue a certificate signing request (CSR) keytool -certreq -alias "my client key" -file mycertreq.csr -keystore my.keystore (self-sign or get your cert signed)

4. Import the trusted CA root certificate keytool -import -alias "my trusted ca" -file caroot.crt -keystore my.keystore

5. Import the PKCS#7 file containg the complete certificate chain keytool -import -alias "my client key" -file mycert.p7 -keystore my.keystore

6. Verify the content the resultant keystore file keytool -list -v -keystore my.keystore
