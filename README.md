# comission_calculate_app
Commission Calculator (PocketPal)
A robust Flutter application designed to calculate financial transaction commissions based on complex business logic. The project is built following Clean Architecture principles and incorporates the Strategy Pattern to handle various commission rules dynamically.

🛠 Technologies and Packages Used
Flutter: Main framework for cross-platform development.

State Management: flutter_bloc (Cubit) for predictable state transitions.

Navigation: go_router for declarative routing.

Dependency Injection: get_it for decoupling classes.

Functional Programming: either_dart for robust error handling.

UI & Animations: flutter_screenutil (responsive design), shimmer (loading states), flutter_sticky_header.

Utilities: intl (date formatting), equatable (value equality).

Main Features
Complex Commission Logic:

Cash In: 0.03% commission with a maximum cap.

Cash Out (Business): Flat 0.5% rate.

Cash Out (Private): 0.3% rate with a 1000 EUR free weekly limit for the first 3 operations.

Multi-Currency Support: Automatic conversion and rounding for EUR, USD, and JPY.

Transaction Grouping: Displays transactions grouped by week using sticky headers.

Clean Architecture: Strict separation of concerns (Data, Domain, Presentation).

Unit Testing: Core business rules are verified with automated tests.

🏗 Project Architecture
The project follows a Feature-based Clean Architecture:

Core: Shared utilities (CurrencyHelper, UserHistoryTracker), constants, and common widgets.

Features (e.g., Home):

Data: Repositories implementations, Data Sources (CSV/JSON), and Models.

Domain: Entities, Repository Interfaces, Use Cases, and Strategy Rules.

Presentation: UI Views, Components (Widgets), and Cubits for state management.


Screenshot / Demo Video
The following video demonstrates the general workflow of the application:

📲 App Demo


Ios--->>   https://github.com/user-attachments/assets/6fc6fce4-9bbc-492e-b92d-98e2348678fa
Android ----->  https://github.com/user-attachments/assets/2c62ac75-7eb0-49f3-a31b-181201c2b213











