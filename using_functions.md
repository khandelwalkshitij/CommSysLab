Assume you need to write a function that outputs the reciprocal of the square root of the magnitude of a given number and use it in MATLAB. This is how you'll go about it.

##### STEP 1:
Create a new `.m` file and name it as (say) `sqrtrec.m`
In this newly created file, start as ~
```
function y = sqrtrec(x)
  y = 1/sqrt(abs(x));
end
```

##### STEP 2:
Now, call this file in your command line, or in any other script that your writing in the same directory.

Eg.
```
>> sqrtrec(-25)

ans =

    0.2000
```
