# Flashcards App

A simple Rails 8 application for practicing flashcards with decks, quiz attempts, and scoring.

## Features

- Create decks and add flashcards
- Study decks with “Reveal Answer” and mark as “Got it” or “Needs practice”
- Tracks correct and total counts for each quiz attempt

## Setup
# Install dependencies
```
bundle install
yarn install
```
# Set up the database
```
rails db:create db:migrate db:seed
```
# Run the server
```
rails server
```