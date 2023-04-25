Share access to an API
======================

This example is based on the [Consumer Pull](
https://github.com/eclipse-edc/Samples/blob/main/transfer/transfer-06-consumer-pull-http/README.md) example.
You can find detailed explanations on the workflow there.
Differences are mainly the adaption for the different URLs to be used in this MVDS setup and a slightly adapted asset configuration to allow the proxy to forward query parameters, request methods, body and path.

Execute the scripts in order to run the whole test case:

- Scripts `01` to `05` set up the required resources.
- Script `06` update the consumer with the offers provided by the provider.
- Script `07` initiates the negotiation between consumer and provider and if successful results in information on the access to the API (endpoint + token) to be published to an endpoint on the consumer side.
- Script `08` extracts the pushed information and executes a GET request via the proxy to the API.
    You can pass an argument to the script to extend the path or add query parameters, e.g. `./08-extract-pushed-info.sh subpath?param=value`.
    The script shows the log output of the provider where you can see which request is made to mock API.
