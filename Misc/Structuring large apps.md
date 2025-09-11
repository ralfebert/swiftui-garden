* Avoid `@Environment` and dependency-resolvers like `@Dependency` -  convenient yes, but:
	* they hide the dependencies
	* "everything accessible everywhere" leads to "everything accessed everywhere"
	* @Dependency and the like are mostly resolving using thread-local storage which doesn't go together with structured concurrency and its "you shouldn't concern yourself with the threads anymore"
* Leaf view types / view types that are at the bottom of the view hierarchy only map data -> presentation - pass structs of data only
	* Action struct pattern for everything such a View cannot handle on its own
* struct Data types only store data and offer convenience logic as long as they can do that on their own
	* data never knows where it's coming from or talks with these data sources – it can be tempting to offer convenience methods that needs to talk to data source (and wants to know or resolve them therefore) - don't.
* Model/Repo/Coordinator objects (@Observable or plain objects) are used by outer coordinator views – here the logic happens and the parts are wired up together
	- explicit lifecycle (Who is responsible for creating this and when? (can be owned by Views or other Models or an App-wide Model)
		- Careful with @State when the View owns the model: https://x.com/alpennec/status/1792454429427524034
	- Clear ownership: Who is the owner of this object? 
	- get passed their dependencies to do their job via init params
		- no runtime resolving - you need to have/pass through everything needed to get the job done -> yes, this means additional code and additional refactoring work when features change - but it's easy to reason about and always trivial to write, no hidden complexity
		* create...() factory methods as clean and straightforward way to do dependency injection
	* "What does this thing need to get it's job done?" is the important question
* All this means more boilerplate which is worth it for having a clear simple flow that's easy to follow. Code that's easy to reason about with boilerplate to enable this clarity is better than a compact but knotted ball of wool
* Enables: Dead-simple and powerful .fixtures struct pattern for Previews and Unit Tests