sJSON := JSON.GetFromUrl("https://api.wazirx.com/api/v2/tickers/dogeusdt")
oJSON := JSON.Parse(sJSON)
ToolTip, % "Dogecoin is now worth $" . oJSON.ticker.buy
Sleep, 1500
ToolTip  
class JSON
{
   static JS := JSON._GetJScripObject()
   
   Parse(JsonString)  {
      try oJSON := this.JS.("(" JsonString ")")
      catch  {
         MsgBox, Wrong JsonString!
         Return
      }
      Return this._CreateObject(oJSON)
   }
   
   GetFromUrl(url)  {
      XmlHttp := ComObjCreate("Microsoft.XmlHttp")
      XmlHttp.Open("GET", url, false)
      XmlHttp.Send()
      Return XmlHttp.ResponseText
   }

   _GetJScripObject()  {
      VarSetCapacity(tmpFile, (MAX_PATH := 260) << !!A_IsUnicode, 0)
      DllCall("GetTempFileName", Str, A_Temp, Str, "AHK", UInt, 0, Str, tmpFile)
      
      FileAppend,
      (
      <component>
      <public><method name='eval'/></public>
      <script language='JScript'></script>
      </component>
      ), % tmpFile
      
      JS := ObjBindMethod( ComObjGet("script:" . tmpFile), "eval" )
      FileDelete, % tmpFile
      JSON._AddMethods(JS)
      Return JS
   }

   _AddMethods(ByRef JS)  {
      JScript =
      (
         Object.prototype.GetKeys = function () {
            var keys = []
            for (var k in this)
               if (this.hasOwnProperty(k))
                  keys.push(k)
            return keys
         }
         Object.prototype.IsArray = function () {
            var toStandardString = {}.toString
            return toStandardString.call(this) == '[object Array]'
         }
      )
      JS.("delete ActiveXObject; delete GetObject;")
      JS.(JScript)
   }

   _CreateObject(ObjJS)  {
      res := ObjJS.IsArray()
      if (res = "")
         Return ObjJS
      
      else if (res = -1)  {
         obj := []
         Loop % ObjJS.length
            obj[A_Index] := this._CreateObject(ObjJS[A_Index - 1])
      }
      else if (res = 0)  {
         obj := {}
         keys := ObjJS.GetKeys()
         Loop % keys.length
            k := keys[A_Index - 1], obj[k] := this._CreateObject(ObjJS[k])
      }
      Return obj
   }
}