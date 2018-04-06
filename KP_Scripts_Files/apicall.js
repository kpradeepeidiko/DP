var urlopen = require ('urlopen');
var hm = require('header-metadata');
var options = {
	target: 'https://api.ciscospark.com/v1/people/me',
	sslClientProfile: 'SSL_Spark_Cert',
	method: 'get',
	headers: {"Authorization":"Bearer NDgzN2M5MDYtY2VkNi00N2EwLWIwYjctZDQxODQ0Nzg2YTkwMmRjYTAxYzMtZmVk"}
};


urlopen.open (options, function (error, response) {
	if (error) {
		session.output.write ("urlopen connect error: " + JSON.stringify(error));
	} else {
		var responseStatusCode = response.statusCode;
		if (responseStatusCode == 200) {
			response.readAsJSON(function(error, responseData) {
				if (error) {
					session.output.write("readAsBuffer error: " + JSON.stringify(error));
				} else {
					session.output.write(responseData);
					hm.current.set('Content-Type', 'application/json');

				}	 
			});
		} else {
			session.output.write ("urlopen target return statusCode " + responseStatusCode);
		}
}
});