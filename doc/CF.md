
CMD="curl -k -v"
API="https://api.vcap.me"
TOKEN=$( cf oauth-token )

$CMD "${API}/v3/organizations" -X GET -H "Authorization: $TOKEN"
$CMD "${API}/v3/spaces" -X GET -H "Authorization: $TOKEN"


curl "https://api.example.org/v3/apps" \
  -X POST \
  -H "Authorization: bearer [token]" \
  -H "Content-type: application/json" \
  -d '{
    "name": "my_app",
    "relationships": {
      "space": {
        "data": {
          "guid": "2f35885d-0c9d-4423-83ad-fd05066f8576"
        }
      }
    }
  }'


