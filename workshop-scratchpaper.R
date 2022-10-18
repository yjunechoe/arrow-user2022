head(nyc_taxi) %>%
  collect()

nyc_taxi %>%
  filter(year %in% 2017:2021) %>%
  group_by(year) %>%
  summarize(
    all_trips = n(),
    shared_trips = sum(passenger_count > 1, na.rm = TRUE)
  ) %>%
  mutate(pct_shared = shared_trips / all_trips * 100) %>%
  collect()

nyc_taxi %>%
  collect() %>%
  filter(year %in% 2017:2021) %>%
  group_by(year) %>%
  summarize(
    all_trips = n(),
    shared_trips = sum(passenger_count > 1, na.rm = TRUE)
  ) %>%
  mutate(pct_shared = shared_trips / all_trips * 100)

nyc_taxi

nyc_taxi %>%
  filter(year == 2019) %>%
  group_by(month) %>%
  summarize(n = n()) %>%
  collect()

nyc_taxi |>
  filter(year == 2019) |>
  group_by(month) |>
  summarize(longest_trip = max(trip_distance, na.rm = TRUE)) |>
  arrange(month) |>
  collect()
