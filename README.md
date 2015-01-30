# Federal Reserve Bank Info

A simple app to look up bank information by routing number from the federal reserve records.

## Live Link

[Heroku App](http://bank-info.herokuapp.com/)

## Features

1. Fetches current bank info daily using Heroku Scheduler
2. Performs updates in the background using custom rake task
3. Serves JSON bank info at `domain\banks\:routing-number`
4. Provides form-based bank lookup by routing-number

## Example Behavior

`curl http://bank-info.herokuapp.com/banks/655060042`

Output:

```
{
  "name": "SOCIAL SECURITY ADMINISTRATION",
  "routing_number": "655060042",
  "record_type": "Record Type",
  "phone_number": "0000000000",
  "address": {
    "street": "6401 SECURITY BOULEVARD",
    "street_2": null,
    "city": "BALTIMORE",
    "state": "MD",
    "zip_code": "212350000"
  }
}
