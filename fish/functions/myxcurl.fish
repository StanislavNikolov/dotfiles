function myxlogin
	echo "Loging in to localhost:4213. Writing cookie to ~/curlcookie"
	curl -c ~/curlcookies -b ~/curlcookies \
	 -H "Content-Type: application/json" \
	 -X POST http://localhost:4213/api/v1/users/login/ \
	 -d '{"email":"plumber @myxrobotics.com","password":"vyzsy5-matmEf-vascyj"}' -H "Content-Type: application/json"
end

function myxcurl
	curl -c ~/curlcookies -b ~/curlcookies \
	 -H "Content-Type: application/json" \
	 -X $argv[1] http://localhost:4213{$argv[2]} $argv[3..-1]
end
