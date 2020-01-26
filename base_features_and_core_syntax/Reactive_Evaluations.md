## Updating event target values

In Svelte, we leverage the `$:` notation to highjack feature a native JavaScript feature -- one that allows us to follow an assignment to a function
and execute instructions; that is, provided they are written in a `<Name>.svelte` file. Consider the following demonstration where we create a bi-directional
data flow such that events are passed from the DOM to the magical Svelte machine, received by the referrent function, and overwrite the event target's value.

### App.svelte

```javascript
<script>
    let name = "This guy";
    let previousName = name;
    let age = 23;
    let daviCount = 0;
    $: upperCaseName = name.toUpperCase();
    $: console.log(name);
    $: if (daviCount === 1) { alert("Um..."); }
    $: if (name === "David") {
        (function() {
            let forbiddenName = name;
            name = previousName;
            alert(`${forbiddenName} is taken. Choose something else instead.`);
        })();
    }
    
    function incrementAge() {
        age += 1;
    }

    function changeName() {
        name = "Guest";
    }

    function nameInput(event) {

        // It's not immediately clear to me why 
        // `enteredValue` needs to be a `const`, but all's good

        const enteredValue = event.target.value;
        previousName = name;
        name = enteredValue;
    }
<script>

<style>
    h1 {
        color: purple;
    }
</style>

<h1>Hello {upperCaseName}, your age is {30 - ( age - 21 ) }!<h1>
<button on:click="{incrementAge}>Change Age</button>
<button on:click="{changeName}">Logout</button>
<input type="text" value="{value}" on:input="{nameInput}" />
```
