# Database-Structure-Collection

### Author: Bocaletto Luca

## Overview

**Database-Structure-Collection** is a repository that contains a comprehensive collection of SQL scripts. Each script presents a well-documented relational database schema designed for a specific type of application. Whether you need a database for e-commerce, CRM, blog systems, IoT management, or many other common domains, you will find a ready-to-use blueprint in this collection. All scripts are fully commented in English, describing the purpose of each table and field, and are intended to serve as a starting point for your projects.

## Table of Contents

The repository is organized into individual SQL files, each corresponding to a different application domain. Below is a summary of the available schemas:

1. **01_ecommerce.sql**  
   *Description:* Schema for managing an online store. Includes tables for users, product categories, products, orders, order details, payments, and reviews.

2. **02_crm.sql**  
   *Description:* Schema for a Customer Relationship Management system. Contains tables for clients, contacts, leads, opportunities, and activities.

3. **03_cms_blog.sql**  
   *Description:* Schema for a CMS/Blog platform. Supports users, posts, categories, tags, post-tag relationships, comments, and media files.

4. **04_hr.sql**  
   *Description:* Schema for Human Resources management. Includes employees, departments, roles, salaries, absences, and performance reviews.

5. **05_inventory.sql**  
   *Description:* Inventory/Warehouse Management schema. Consists of products, product categories, stock movements, suppliers, purchase orders, and order details.

6. **06_project_management.sql**  
   *Description:* Schema for managing projects and tasks. Contains tables for projects, tasks, team users, assignments, time entries, and project comments.

7. **07_library.sql**  
   *Description:* Schema for managing a library. Includes books, authors, a many-to-many relationship (Book_Authors), book categories, members, and loans.

8. **08_hospital.sql**  
   *Description:* Schema for hospital management. Contains tables for patients, doctors, departments, appointments, prescriptions, and billing.

9. **09_ticketing.sql**  
   *Description:* Ticketing/Helpdesk system schema. Contains tables for tickets, ticket comments, attachments, and ticket categories.

10. **10_social_network.sql**  
    *Description:* Basic social network schema. Provides tables for users, posts, comments, friendships, private messages, groups, and group memberships.

11. **11_online_learning.sql**  
    *Description:* Schema for an online learning platform. Supports users (students/instructors), courses, lessons, enrollments, assignments, and grades.

12. **12_restaurant.sql**  
    *Description:* Schema for managing restaurant reservations and ordering. Includes tables for restaurants, tables, customers, reservations, menus, orders, order details, and staff.

13. **13_music_streaming.sql**  
    *Description:* Schema for a music streaming service. Includes users, artists, albums, tracks, playlists, and a many-to-many relationship between playlists and tracks.

14. **14_real_estate.sql**  
    *Description:* Schema for real estate management. Contains tables for properties, real estate agents, clients, property listings, appointments, and contracts.

15. **15_event_management.sql**  
    *Description:* Schema for managing events and ticketing. Includes tables for events, venues, tickets, attendees, sponsors, and event schedules.

16. **16_fitness_gym.sql**  
    *Description:* Schema for managing a fitness or gym facility. Contains tables for gym members, trainers, class schedules, membership plans, and check-ins.

17. **17_travel_booking.sql**  
    *Description:* Schema for an online travel booking system. Includes tables for customers, bookings, flights, hotels, tours, and booking details.

18. **18_car_rental.sql**  
    *Description:* Schema for a car rental system. Contains tables for cars, customers, branches, rentals, and payments.

19. **19_financial_portfolio.sql**  
    *Description:* Schema for investment portfolio management. Supports investors, assets, portfolios, portfolio holdings, trades, and market data.

20. **20_iot_devices.sql**  
    *Description:* Schema for IoT device management. Includes tables for devices, sensors, sensor readings, alerts, device groups, and group memberships.

21. **21_freelance_marketplace.sql**  
    *Description:* Schema for a freelance marketplace platform. Supports users, job posts, proposals, contracts, reviews, and payment milestones.

22. **22_job_board.sql**  
    *Description:* Schema for a job board platform. Contains employers, job posts, categories, and candidate applications.

23. **23_supply_chain.sql**  
    *Description:* Schema for supply chain management. Handles suppliers, manufacturers, distributors, products, orders, and shipments.

24. **24_logistics_shipping.sql**  
    *Description:* Schema for logistics and shipping operations. Contains warehouses, carriers, shipments, and tracking events.

25. **25_auction_platform.sql**  
    *Description:* Schema for an online auction system. Manages users, items, auctions, bids, and reviews.

26. **26_food_delivery.sql**  
    *Description:* Schema for a food delivery service. Includes restaurants, menus, menu items, customers, orders, deliveries, and reviews.

27. **27_forum.sql**  
    *Description:* Schema for an online forum/discussion board. Contains users, threads, posts, categories, and private messages.

28. **28_university_management.sql**  
    *Description:* Schema for managing a university or college. Includes students, professors, courses, enrollments, class schedules, and grades.

29. **29_crypto_exchange.sql**  
    *Description:* Schema for managing a cryptocurrency exchange. Supports users, wallets, cryptocurrencies, orders, trades, and transaction history.

30. **30_volunteer_management.sql**  
    *Description:* Schema for managing volunteer activities and non-profit projects. Contains volunteers, events, projects, volunteer assignments, and donations.

31. **31_fitness_gym_management.sql**  
    *(Alternate version of a gym management schema)*

32. **32_online_learning_alternate.sql**  
    *Alternate design for an online learning platform (if applicable)*

33. **33_restaurant_alternate.sql**  
    *Alternate design for a restaurant reservation system (if applicable)*

34. **34_xxx.sql**  
    *Replace with additional schemas as needed…*

> **Note:** The repository currently includes 30 core SQL files as part of the collection. You may add or remove files as your project evolves.

## How to Use

### Open your MySQL Client or phpMyAdmin:
1. **Create a new database** or select an existing one.
2. **Import the desired SQL file(s)** from the collection.
3. **Customize:**  
   - Adjust field sizes, indices, constraints, and other details according to your project’s requirements.

## Contribution Guidelines
Contributions are welcome! Feel free to:
- **Add new database schemas** to the collection.
- **Improve existing SQL scripts** with additional comments or modifications.
- **Report issues** or suggest enhancements.

### Pull Requests
When submitting a **pull request**, please:
- Include clear descriptions of your changes.
- Follow the existing code style used in this repository.
- Ensure the SQL scripts are properly formatted and commented.
