curl    -H "Content-Type: application/json"   -d '
{ "auth": {
    "identity": {
      "methods": ["password"],
      "password": {
        "user": {
          "name": "admin",
          "domain": { "id": "default" },
          "password": "1"
        }
      }
    },
    "scope": {
      "project": {
        "name": "demo",
        "domain": { "id": "default" }
      }
    }
  }
}'   http://localhost:5000/v3/auth/tokens | python -m json.tool


curl -i   -H "Content-Type: application/json"   -d '
{ "auth": {
    "identity": {
      "methods": ["password"],
      "password": {
        "user": {
          "name": "admin",
          "domain": { "id": "default" },
          "password": "1"
        }
      }
    },
    "scope": {
      "project": {
        "name": "demo",
        "domain": { "id": "default" }
      }
    }
  }
}'   http://localhost:5000/v3/auth/tokens


curl -i -X GET http://192.168.0.44:9876/v2.0/pools -H "X-Auth-Token: $TOKEN"


SAMPLE JSON:

{
	"pool": {
		"lb_algorithm": "ROUND_ROBIN",
		"name": "my-pool",
		"protocol": "HTTP",
		"subnet_id": "e301aed0-d9e7-498a-977c-1bbfaf14ed5d",
		"listener_id": "39de4d56-d663-46e5-85a1-5b9d5fa17829"
	}
}

curl -i -X POST http://192.168.0.44:9876/v2.0/pools -H "X-Auth-Token: $TOKEN" -H "Content-Type: application/json" -d '{"lb_algorithm":"ROUND_ROBIN","name":"pool1","protocol":"HTTP","listener_id":"f2d4b50c-56ab-4a8b-8a3c-099f8e1dd5c4"}'
