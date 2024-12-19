Installed Packages
dependencies:
  get: ^latest_version
  shared_preferences: ^latest_version

State Management & Local Storage
GetX State Management
The application utilizes GetX for state management to keep the state of the todo list across all pages. This ensures:

Shared Preferences Implementation
Shared Preferences is used to persist todo items locally on the device. This allows:

Todo list data to persist through app restarts
Access to todos when offline
Immediate availability of data upon app launch

How It Works

Initial Load:

Controller initialises when the app is launched, TodoController. Controller fetches stored todos from Shared Preferences. Update todo list state with stored data.

Data Operations:

New todos will be saved to GetX state and Shared Preferences simultaneously; this will ensure persistence and live state updates. Keep the todo list in sync within the memory and local storage.
