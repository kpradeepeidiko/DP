var urlopen = require ('urlopen');
var hm = require('header-metadata');
var acessToken = session.name('sp').getVar('accessToken');
    console.error("act "+session.name('sp').getVar('accessToken'));




var options = {
			target: 'https://api.ciscospark.com/v1/rooms',
			sslClientProfile: 'SECURE',
			method: 'get',
			headers: {"Authorization":Bearer M2ZiOTM5NDYtYmQwYi00MDMyLTg2ZmItOGNlZDM2ZDQ5ZDJjZDI2MmI2NTQtMzI3,"Content-type":application/json}
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