

Data:
	Deals with data fetching (APIs, Local DB) and data models.	Implements the abstract contracts defined in the Domain layer.	Separates how data is retrieved from what data is needed.

Domain:
	Contains the core business logic: Entities, Use Cases, and Repositories (abstract interfaces).
    The core, pure business logic, independent of any framework.	Keeps the core logic reusable and testable without Flutter/API dependencies

Presentation:
	Houses the UI (Widgets) and the State Management logic (BLoC/Cubit).
    Manages user interaction and displays data fetched via the Domain layer.
	Separates UI rendering from business logic and data handling
********************************************************************
Project Description:

lib/
├── core/             # Common utilities (e.g., constants, theme, error handling)
├── data/
│   ├── datasources/  # Remote (API) and Local data sources
│   ├── models/       # Data transfer objects (DTOs) from API
│   └── repositories/ # Concrete implementation of Domain Repository
├── domain/
│   ├── entities/     # Core business objects (e.g., `ProductEntity`)
│   ├── repositories/ # Abstract interfaces (e.g., `ProductRepository`)
│   └── usecases/     # Business rules (e.g., `GetProductsUseCase`)
└── presentation/
    ├── bloc/         # BLoC/Cubit files for state management
    ├── pages/        # Full screen pages (e.g., `LoginPage`)
    └── widgets/      # Reusable UI components