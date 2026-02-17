# COMMISSION_CALCULATE_APP
# PURPOSE OF THE APPLICATION
PocketPal is a robust Flutter application for calculating financial commissions. It uses Clean Architecture and the Strategy Pattern to handle dynamic business rules.

# TECHNOLOGIES AND PACKAGES USED
State Management: flutter_bloc (Cubit) for predictable state.

Navigation: go_router for declarative routing.

Dependency Injection: get_it for decoupling classes.

Functional Programming: either_dart for robust error handling.

UI & Animations: flutter_screenutil, shimmer, and flutter_sticky_header.

Utilities: intl for formatting and equatable for value equality.

# MAIN FEATURES
Complex Commission Logic:

Cash In: 0.03% fee with a maximum cap.

Cash Out (Business): Flat 0.5% rate.

Cash Out (Private): 0.3% rate with a 1000 EUR free weekly limit.

Multi-Currency Support: Automatic conversion and rounding for EUR, USD, and JPY.

Transaction Grouping: Weekly grouping using sticky headers.

Unit Testing: Core business rules verified with automated tests.

# PROJECT ARCHITECTURE
The project follows a Feature-based Clean Architecture:

Core: Shared utilities, constants, and common widgets.

Data: Repository implementations, Data Sources, and Models.

Domain: Entities, Repository Interfaces, Use Cases, and Strategy Rules.

Presentation: UI Views, Components, and Cubits.

# APP DEMOS
iOS Demo: Watch here

Android Demo: Watch here
