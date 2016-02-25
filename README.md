# Voting API

An API that gives you access to race, candidate, voter and vote information.

## Getting started

Install the necessary gems
```bash
bundle install
```

Get your server up and running
```bash
bin/rails server
```

## Create a new candidate
```bash
POST /candidates/create?name=[name]
```

## Register as a voter
```bash
POST /voters/create?name=[name]&party=[party]
```
You'll receive your voter token in the response. This will be used later in order to be able to edit voter info, cast a vote, and delete a vote.

## Cast a vote
```bash
POST /votes/create?voter_id=[your_voter_id]&candidate_id=[candidate_id]&token=[your_voter_access_token]
```
This action will not work with an incorrect token or if a vote has already been cast.

An [ERD can be found here](https://www.lucidchart.com/invitations/accept/1928e8f8-8d9c-405d-859f-80c143101f86)
