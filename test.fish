#!/usr/bin/fish

source .env

export TRACK_ID=(./base62conv.py $argv[1] || exit)
export FILE_ID=(curl 'https://spclient.wg.spotify.com/metadata/4/track/'$TRACK_ID'?market=from_token' \
		-H 'accept: application/json' \
		-H 'accept-language: en' \
		-H 'app-platform: Linux' \
		-H 'authorization: Bearer '$AUTHORIZATION \
		-H 'client-token: '$CLIENT_TOKEN \
		-H 'if-none-match: "MC-Dffapw=="' \
		-H 'origin: https://xpui.app.spotify.com' \
		-H 'referer: https://xpui.app.spotify.com/' \
		-H 'sec-ch-ua: "Not(A:Brand";v="24", "Chromium";v="122"' \
		-H 'sec-ch-ua-mobile: ?0' \
		-H 'sec-ch-ua-platform: "Linux"' \
		-H 'sec-fetch-dest: empty' \
		-H 'sec-fetch-mode: cors' \
		-H 'sec-fetch-site: same-site' \
		-H 'spotify-app-version: 1.2.37.701' \
		-H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.6261.130 Spotify/1.2.37.701 Safari/537.36' | jq -r ".file[6].file_id")
export URL=(curl 'https://gue1-spclient.spotify.com/storage-resolve/v2/files/audio/interactive/10/'$FILE_ID'?version=10000000&product=9&platform=39&alt=json' \
		-H 'accept: */*' \
		-H 'accept-language: en-CA,en-GB;q=0.9,en-US;q=0.8,en;q=0.7' \
		-H 'authorization: Bearer '$AUTHORIZATION \-H 'client-token: '$CLIENT_TOKEN \
		-H 'origin: https://open.spotify.com' \
		-H 'priority: u=1, i' \
		-H 'referer: https://open.spotify.com/' \
		-H 'sec-ch-ua: "Chromium";v="131", "Not_A Brand";v="24"' \
		-H 'sec-ch-ua-mobile: ?0' \
		-H 'sec-ch-ua-platform: "Linux"' \
		-H 'sec-fetch-dest: empty' \
		-H 'sec-fetch-mode: cors' \
		-H 'sec-fetch-site: same-site' \
		-H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36' | jq -r ".cdnurl[0]")
curl $URL \
		 -H 'Accept: */*' \
		 -H 'Accept-Language: en-CA,en-GB;q=0.9,en-US;q=0.8,en;q=0.7' \
		 -H 'Connection: keep-alive' \
		 -H 'Origin: https://open.spotify.com' \
		 -H 'Referer: https://open.spotify.com/' \
		 -H 'Sec-Fetch-Dest: empty' \
		 -H 'Sec-Fetch-Mode: cors' \
		 -H 'Sec-Fetch-Site: cross-site' \
		 -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36' \
		 -H 'sec-ch-ua: "Chromium";v="131", "Not_A Brand";v="24"' \
		 -H 'sec-ch-ua-mobile: ?0' \
		 -H 'sec-ch-ua-platform: "Linux"' -o $argv[1].mp4