-- create database
create database airbnb;
-- make the database active
use airbnb;

-- load the datasets into the created database

-- preview the datasets
select * from calendar_airbnb;
select * from listings_clean;
select * from neighborhood_kpis;
select * from reviews_clean;
select * from roi_scores;

-- dates cleaning
select date from calendar_airbnb;
alter table calendar_airbnb modify column date date;
alter table reviews_clean modify column review_date date;

-- Analysis Questions
-- 1. •	Occupancy rate
SELECT
    neighbourhood,
    AVG(occupancy_rate) AS avg_occupancy_rate
FROM listings_clean
GROUP BY neighbourhood
ORDER BY avg_occupancy_rate DESC;

-- 2. Average Nightly Price per Neighborhood
SELECT
    neighbourhood,
    AVG(price_per_night) AS avg_nightly_price
FROM listings_clean
GROUP BY neighbourhood
ORDER BY avg_nightly_price DESC;

-- 3. Estimated Monthly Revenue per Neighborhood
SELECT
    neighbourhood,
    AVG(estimated_monthly_revenue) AS avg_monthly_revenue
FROM listings_clean
GROUP BY neighbourhood
ORDER BY avg_monthly_revenue DESC;

-- 4.	Number of listings per neighborhood (competition level)
SELECT
    neighbourhood,
    COUNT(listing_id) AS total_listings
FROM listings_clean
GROUP BY neighbourhood
ORDER BY total_listings DESC;

-- Reviews by demand
SELECT
    l.neighbourhood,
    COUNT(r.listing_id) AS total_reviews
FROM reviews_clean r
JOIN listings_clean l
    ON r.listing_id = l.listing_id
GROUP BY l.neighbourhood
ORDER BY total_reviews DESC;

