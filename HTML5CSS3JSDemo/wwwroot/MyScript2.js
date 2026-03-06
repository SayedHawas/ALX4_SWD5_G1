
      // window.alert("Welcome in Js From External file ....");

      //document.getElementById('para').innerHTML+='<h1 style=color:blue;> Welcome DOM </h1>'
      //Recursive method
      function factorial(Number)
      {
            if(Number<1)
                return 0;
            if(Number==1)
                return 1;
            else 
                return Number *factorial(Number-1);
      }

      //Show From Void
      function ShowResult(inputId , valueResult)
      {
        document.getElementById(inputId).innerText =  valueResult;
      }

      //get value   Return
      function GetValue(inputId)
      {
        var x = document.getElementById(inputId).value;
          return x
      }

      //
      

