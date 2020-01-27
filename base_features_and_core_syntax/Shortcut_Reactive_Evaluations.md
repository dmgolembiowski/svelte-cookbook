## Updating event target values

See the previous file, Dynamic_Evaluations.md
We can replace
```javascript
<input type="text" value ={value} on:input={nameInput} />
// with
<input type="text" bind:value={name} />
```
and achieve a similar effect.

