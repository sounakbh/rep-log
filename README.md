# Rep Log

An exercise tracker with GitHub Pages for the web app and Supabase for email sign-in and a private workout database.

## Setup

1. In a Supabase project you own, open SQL Editor and run `schema.sql`.
2. In Authentication → Users, create your own email/password user. With an administrator-created user, you can disable public registrations in Authentication settings.
3. Set the project URL and publishable key in `docs/config.js`. The publishable key belongs in browser code. Keep secret and service-role keys out of this repository.
4. In this GitHub repository, set Settings → Pages to deploy from `main`, folder `/docs`.
5. Open the published URL and sign in on each device using the Supabase user you created. Workout data is stored in Supabase. Only the sign-in session is held in browser session storage.

The database uses row-level security to isolate each user's routines and workout history. The source repository contains no personal workout records.
