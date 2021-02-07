# Boris Bikes 
London's Boris Bikes (well, 'Santander Cycles') are awesome. Anyone can hire out a bike and ride it around London.

Transport for London, the body responsible for delivery of a new bike system, came to us with a plan: a network of docking stations and bikes that anyone can use. They wanted us to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

Makers has designated Boris Bikes as the afternoon's task for its first week. This app is coded in order to satisfy the user requirements and each of the challenges.

### The challenges

1. [Setting up a Project](1_setting_up_a_project.md)
2. [Working with User Stories](2_working_with_user_stories.md)
3. [From a Domain Model to a Feature Test](3_from_domain_models_to_feature_tests.md)
4. [Errors are good](4_errors_are_good.md)
5. [From Feature Tests to Unit Tests](5_from_feature_tests_to_unit_tests.md)
6. [Passing your first Unit Test](6_passing_your_first_unit_test.md)
7. [Back to the feature](7_back_to_the_feature.md)
8. [Back to the unit](8_back_to_the_unit.md)
9. [Building a bike](9_building_a_bike.md)
10. [Making Docking Stations get Bikes](10_making_stations_release_bikes.md)
11. [Using Instance Variables](11_using_instance_variables.md)
12. [Raising Exceptions](12_raising_exceptions.md)
13. [Limiting Capacity](13_limiting_capacity.md)
14. [Using Complex Attributes](14_complex_attributes.md)
15. [The Single Responsibility Principle](15_single_responsibility_principle.md)
16. [Removing Magic Numbers](16_removing_magic_numbers.md)
17. [Initialization Defaults](17_initialization_defaults.md)
18. [Dealing with Broken Bikes](18_dealing_with_broken_bikes.md)
19. [Isolating Tests with Doubles](19_isolating_tests_with_doubles.md)
20. [Mocking Behaviour on Doubles](20_mocking_behaviour_on_doubles.md)
21. [Men with Ven](21_men_with_ven.md)
22. [Modules as Mixins](22_modules_as_mixins.md)


## How to use?
```
bike = Bike.new # creates a new Bike
docking_station = DockingStation.new # creates a new DockingStation
docking_station.dock(bike) # docks a bike at the station
docking_station.release_bike # releases a bike from the station
```
## Installation 
Fork and clone this repo.
