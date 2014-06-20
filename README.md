HotelReservation
=============

Usages
==============

1. gem build hotel\_reservation.gemspec
2. gem install hotel\_reservation
3. hotel\_reservation
Press Ctrl + D to exit

Design Principles
==============

The core concepts are encapsulated as domain entities, such as Hotel, RatesPolicy and so on. 
They are mostly simple data structure, they could be reused across different applications.

In order to separate interface operations from core application, 
all operations are encapsulated in class Driver in bin/hotel\_operation. 

And the interactions between entities and users are captured by three main use cases:
SetRatesUseCase, SumRatesUseCase, FindHotelUseCase.
These use cases provide *'executes'* which accepts UseCaseRequest argument.

Basically, now the main application is only a plugin to core application, and clear boundary is
drawn between core and main application.
