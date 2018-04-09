var urlopen = require ('urlopen');
var hm = require('header-metadata');
var accessToken = "";
session.input.readAsJSON( function ( error, json) {
	if ( error ) {
		session.reject( 'input is not a valid JSON document' );
		return;
	}else{
		var token = json.access_token;
		accessToken = "Bearer ";
		accessToken = accessToken.concat(token);
		
		session.input.setVar('accesstoken', json.access_token);
		session.input.setVar('roomId', json.roomId);
		session.input.setVar('text', json.text);
		
       console.error('json.roomId '+json.roomId);
       console.error('json.text '+json.text);
	   hm.current.set("Content-type", "application/json");
	   var jsonData = {};
	   jsonData.roomId = json.roomId;
	   jsonData.text = json.text;
	   
		var options = {
			target: 'https://api.ciscospark.com/v1/messages',
            sslClientProfile: 'TEST_Profile',
			method: 'post',
			headers: {"Authorization":accessToken,"Content-Type":"application/json"},
			data: jsonData
	
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
						} else 
						
						{

							session.output.write(responseData);
						} 
					});
				} else {
					session.output.write (JSON.stringify(response));
				}
			}
		});
	}
});
