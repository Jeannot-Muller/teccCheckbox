#tag Class
Protected Class teccCheckbox
Inherits WebSDKUIControl
	#tag Event
		Sub DrawControlInLayoutEditor(g as graphics)
		  // Visual WebSDK controls can "draw" themselves in the IDE
		  
		  '// todo4
		  g.FontName = "Helvetica"
		  g.FontUnit = FontUnits.Point
		  g.FontSize = 21
		  
		  If BooleanProperty("enabled") = False Then
		    g.Transparency = 60
		  Else
		    g.Transparency = 0
		  End If
		  '
		  g.DrawingColor = &cff0000
		  g.FillRectangle(0, 0, 25, 25 )
		  
		  
		  'If BooleanProperty("visible") = True Then
		  'Select Case IntegerProperty("CrownPosition")
		  'Case 0
		  'g.DrawingColor = ColorProperty( "ActiveColor" ) 
		  'g.FillRoundRectangle(0, 0, 66, 29, 18, 18)
		  'g.DrawingColor = ColorProperty( "ActiveCrown" ) 
		  'g.FillOval(40,5,18,18)
		  'g.DrawingColor = ColorProperty( "DeactiveColor" ) 
		  'g.DrawText( Chr(216), 7, 22 )
		  'g.DrawingColor = ColorProperty( "DeactiveCrown" ) 
		  'g.FillOval(45,10,8,8)
		  'Case 1
		  'g.DrawingColor = ColorProperty( "ActiveColor" ) 
		  'g.FillRoundRectangle(0, 0, 66, 29, 18, 18)
		  'g.DrawingColor = ColorProperty( "ActiveCrown" ) 
		  'g.FillOval(10,5,18,18)
		  'g.DrawingColor = ColorProperty( "DeactiveColor" ) 
		  'g.DrawText( Chr(216), 43, 22 )
		  'g.DrawingColor = ColorProperty( "DeactiveCrown" ) 
		  'g.FillOval(15,10,8,8)
		  'Case 2
		  'g.DrawingColor = ColorProperty( "ActiveColor" ) 
		  'g.FillRoundRectangle(0, 0, 29, 66, 18, 18)
		  'g.DrawingColor = ColorProperty( "ActiveCrown" ) 
		  'g.FillOval(5,8,18,18)
		  'g.DrawingColor = ColorProperty( "DeactiveColor" ) 
		  'g.DrawText( Chr(216), 7, 60 )
		  'g.DrawingColor = ColorProperty( "DeactiveCrown" ) 
		  'g.FillOval(10,13,8,8)
		  'Case 3
		  'g.DrawingColor = ColorProperty( "ActiveColor" ) 
		  'g.FillRoundRectangle(0, 0, 29, 66, 18, 18)
		  'g.DrawingColor = ColorProperty( "ActiveCrown" ) 
		  'g.FillOval(5,40,18,18)
		  'g.DrawingColor = ColorProperty( "DeactiveColor" ) 
		  'g.DrawText( Chr(216), 6, 22 )
		  'g.DrawingColor = ColorProperty( "DeactiveCrown" ) 
		  'g.FillOval(10,45,8,8)
		  'End Select
		  'end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ExecuteEvent(name as string, parameters as JSONItem) As Boolean
		  // Events sent with TriggerServerEvent using your controlID will end up here
		  Try
		    
		    Select Case Name
		    Case "teccCheckboxClick"
		      
		      Try
		        If parameters.value("target") = "INPUT" Then
		          If Me.Enabled Then
		            objectid = Parameters.value("ID")
		            mvalue = Parameters.value("value")
		            teccCheckboxClick()
		            
		            Return True
		          End If 
		        End If
		      Catch err As OutOfBoundsException
		        
		      End Try
		      
		    End Select
		    
		  Catch
		    
		  End Try
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(Request As WebRequest, Response As WebResponse) As Boolean
		  #Pragma unused Request
		  #Pragma unused Response
		  // Requests sent to the session with the following pattern
		  // 
		  // /<Session Identifier>/sdk/<controlID>/request_path
		  
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  // Name of your JavaScript class which extends XojoWeb.XojoVisualControl
		  Return "tecc.teccCheckbox"
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Self.Style.value("outline") = "none"
		  mvalue = false
		  'If InitiallyOff = True Then
		  'mvalue = False
		  'End If
		  'Call refreshValues()
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Serialize(js as JSONItem)
		  // Use this method to serialize the data your control needs for initial setup
		  
		  
		  Var borderWidthStr As String = "--borderwidth: 2px;"
		  Var borderStyleStr As String = "--borderwidth: 1px;"
		  
		  Select Case CheckboxBorder
		  Case BorderDimensions.Thin
		    borderWidthStr = "--borderwidth: 1px;"
		  Case BorderDimensions.Medium
		    borderWidthStr = "--borderwidth: 2px;"
		  Case BorderDimensions.Big
		    borderWidthStr = "--borderwidth: 4px;"
		  End Select
		  
		  Select Case borderStyle
		  Case BorderStyles.dashed
		    borderStyleStr = "--borderstyle: dashed;"
		  Case BorderStyles.dotted
		    borderStyleStr = "--borderstyle: dotted;"
		  Case BorderStyles.Double
		    borderStyleStr = "--borderstyle: double;"
		  Case BorderStyles.groove
		    borderStyleStr = "--borderstyle: groove;"
		  Case BorderStyles.inset
		    borderStyleStr = "--borderstyle: inset;"
		  Case BorderStyles.outset
		    borderStyleStr = "--borderstyle: outset;"
		  Case BorderStyles.ridge
		    borderStyleStr = "--borderstyle: ridge;"
		  Case BorderStyles.solid
		    borderStyleStr = "--borderstyle: solid;"
		  End Select
		  '
		  js.value("value") = value
		  js.value("borderwidth") = borderWidthStr
		  js.value("borderstyle") = borderStyleStr
		  js.value("bordercolor") = " --bordercolor: #" + BorderColor.ToString.Right(6) + ";"
		  js.value("markercolor") = " --markercolor: #" + MarkerColor.ToString.Right(6) + " !important;" 
		  'js.value("coloron") = "#" + ActiveColor.ToString.Right(6)
		  'js.value("coloroff") = "#" + DeactiveColor.ToString.Right(6)
		  'js.value("crownposition") = cposition 
		  'js.value("activecrown") = "#" + ActiveCrown.ToString.Right(6)
		  'js.value("deactivecrown") = "#" + DeactiveCrown.ToString.Right(6)
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionCSSURLs(session as WebSession) As String()
		  #Pragma unused Session
		  // Return an array of CSS URLs for your control
		  // Here's one way to do this...
		  
		  If teccCheckboxCSS = Nil Then
		    Var cssStr As String
		    Var css() As String
		    
		    css.Add(".teccCheckbox {")
		    css.Add("display: inline-flex;")
		    css.Add("cursor: pointer;")
		    css.Add("position: relative;")
		    css.Add("--left: 5px;")
		    css.Add("--top: -2.5px;")
		    css.Add("--bordercolor: #0096ff;")
		    css.Add("--markercolor: #0096ff;")
		    css.Add("--borderwidth: 2px;")
		    css.Add("--borderstyle: solid;")
		    css.Add("}")
		    css.Add(".teccCheckbox > span {")
		    css.Add("color: var(--markercolor);")
		    css.Add("padding: 0.5rem 0.25rem;")
		    css.Add("}")
		    css.Add(".teccCheckbox > input {")
		    css.Add("height: 25px;")
		    css.Add("width: 25px;")
		    css.Add("-webkit-appearance: none;")
		    css.Add("-moz-appearance: none;")
		    css.Add("-o-appearance: none;")
		    css.Add("appearance: none;")
		    css.Add("border: var(--borderwidth) var(--borderstyle) var(--bordercolor);")
		    css.Add("border-radius: 4px;")
		    css.Add("outline: none;")
		    css.Add("transition-duration: 0.3s;")
		    css.Add("background-color: #ffffff;")
		    css.Add("cursor: pointer;")
		    css.Add("}")
		    css.Add(".teccCheckbox > input:checked {")
		    css.Add("border: var(--borderwidth) var(--borderstyle) var(--bordercolor);")
		    css.Add("background-color: #ffffff;")
		    css.Add("}")
		    css.Add(".teccCheckbox > input:checked + span::before {")
		    'css.Add("content: '\2713';") // arrow
		    'css.Add("content: '\002b';") // plus
		    'css.Add("content: '\2212';") // dash
		    css.Add("content: 'x';")
		    css.Add("display: block;")
		    css.Add("text-align: center;")
		    css.Add("color: var(--markercolor);")
		    css.Add("font: 30px/25px Helvetica;")
		    css.Add("position: absolute;")
		    css.Add("left: var(--left);")
		    css.Add("top: var(--top);")
		    css.Add("}")
		    css.Add(".teccCheckbox > input:active {")
		    css.Add("border: var(--borderwidth) var(--borderstyle) var(--bordercolor);")
		    css.Add("}")
		    
		    cssStr = String.FromArray( css, "" )
		    
		    teccCheckboxCSS = New WebFile
		    teccCheckboxCSS.Filename = "teccCheckbox.css"
		    teccCheckboxCSS.MIMEType = "text/css"
		    teccCheckboxCSS.data = cssStr
		    teccCheckboxCSS.Session = Nil 
		  End If
		  
		  Var urls() As String
		  urls.Add( teccCheckboxCSS.URL )
		  
		  Return urls
		End Function
	#tag EndEvent

	#tag Event
		Function SessionHead(session as WebSession) As String
		  #Pragma unused session
		  // Return anything that you needed added to the <head> of the web app
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session as WebSession) As String()
		  #Pragma unused session
		  If JSFramework = Nil Then
		    JSFramework = New WebFile
		    JSFramework.Filename = "teccCheckbox.js"
		    JSFramework.MIMEType ="text/javascript"
		    JSFramework.data = kJSCode
		    JSFramework.Session = Nil 
		  End If
		  
		  Dim urls() As String
		  urls.Add( JSFramework.URL )
		  
		  Return urls
		End Function
	#tag EndEvent


	#tag Hook, Flags = &h0, Description = 4669726573207768656E2074686520636F6E74726F6C20697320636C69636B65642E2052657475726E7320746865206368616E676564207374617475732E0A737461747573203D2074686520737461747573206F662074686520636F6E74726F6C2E0A6F626A6563746964203D20746865206964206F6620746865206372656174656420444F4D20656C656D656E742E
		Event teccCheckboxClick()
	#tag EndHook


	#tag Property, Flags = &h0
		BorderColor As Color = &c0096ff
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderStyle As BorderStyles
	#tag EndProperty

	#tag Property, Flags = &h0
		CheckboxBorder As BorderDimensions
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared JSFramework As WebFile
	#tag EndProperty

	#tag Property, Flags = &h0
		MarkerColor As Color = &c0096ff
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			mValue = value
		#tag EndNote
		Private mvalue As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private objectid As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Symbol As Symbols
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared teccCheckboxCSS As WebFile
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mvalue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mvalue = value
			  
			  Call teccCheckboxClick()
			End Set
		#tag EndSetter
		value As boolean
	#tag EndComputedProperty


	#tag Constant, Name = kJSCode, Type = String, Dynamic = False, Default = \"\"use strict\";\nvar tecc;\n(function (tecc) {\n    class teccCheckbox extends XojoWeb.XojoVisualControl {\n        constructor(id\x2C events) {\n            super(id\x2C events);\n        }\n        render() {\n            super.render();\n            let el \x3D this.DOMElement();\n            if (!el)\n                return;\n            this.setAttributes(el);\n            var idstr \x3D el.id + \"_teccCheckbox\";\n            let btn \x3D document.createElement(\"div\");\n            var disabledStr \x3D \"\";\n            var opacityStr \x3D \"\";\n            if (!this.enabled) {\n                disabledStr \x3D \"disabled\x3D\'disabled\'\";\n                opacityStr \x3D \";opacity: 20%\";\n            }\n            var cbid \x3D \"ts\" + idstr;\n            var iChecked \x3D \"\";\n            if (this.value \x3D\x3D true) {\n                iChecked \x3D \"checked\x3D\'checked\'\";\n            }\n            btn.innerHTML \x3D \"<label class\x3D\'teccCheckbox\'><input id\x3D\'\" + cbid + \"\' class\x3D\'teccCheckbox\' type\x3D\'checkbox\'\" + iChecked + \" style\x3D\'\" + this.borderwidth + this.bordercolor + this.borderstyle + \"\'/><span style\x3D\'\" + this.markercolor  + \"\'></span></label>\";\n            btn.id \x3D idstr;\n            btn.addEventListener(\"click\"\x2C function (event) {\n                var controlObject \x3D XojoWeb.getNamedControl(el.id);\n                var jsonObj \x3D new XojoWeb.JSONItem();\n                jsonObj.set(\'ID\'\x2C el.id);\n                jsonObj.set(\'target\'\x2C event.target.tagName);\n                var c \x3D document.getElementById(cbid).checked;\n                jsonObj.set(\'value\'\x2C c);\n                controlObject.triggerServerEvent(\'teccCheckboxClick\'\x2C jsonObj)\x2C true;\n            });\n            this.replaceEveryChild(btn);\n            this.applyTooltip(el);\n            this.applyUserStyle(el);\n        }\n        updateControl(data) {\n            super.updateControl(data);\n            let js \x3D $.parseJSON(data);\n            this.refresh();\n           this.value \x3D js.value;\n\t   this.borderwidth \x3D js.borderwidth;\n\t   this.bordercolor \x3D js.bordercolor;\n\t   this.markercolor \x3D js.markercolor;\n\t   this.borderstyle \x3D js.borderstyle;\n        }\n    }\n    tecc.teccCheckbox \x3D teccCheckbox;\n})(tecc || (tecc \x3D {}));\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LibraryIcon, Type = String, Dynamic = False, Default = \"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", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NavigatorIcon, Type = String, Dynamic = False, Default = \"iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABemlDQ1BJQ0MgUHJvZmlsZQAAKJF9kE0rRFEYx38GkZemsJCUG8NqiFETGzUzCTWLaYzytrlzzYsy43bnCtlYKFtFiY23BZ+AjYWyVkqRkp0vQGyk6zmGxkt56jnP7zznOf/O+YPLq5vmTEknZLK2FR0IaqNj41rZA6XU4KaJBt3ImYFIJIzEV/0ZL9cUqXrVrrT+nv8blVOJnAFF5cJ9hmnZwoPCLfO2qVjp1VnyKOFlxak8byiO5/noYyYWDQmfCmtGWp8SvhP2GmkrAy6l74l/m0l948zMnPH5HvWTqkR2ZFhqs2QjOaIMEERjiH5C+OmiV1Y/7fjokB12YsFWl0Oz5qI1nUrbWkCcSGhDWaPDq/k6fTKjfP3tV6E3uws9z1C8VujFN+FkFepvCz3PDrhX4Pjc1C39o1Us6Uom4fEQqseg9hIqJnLJbl/+R1VBKL13nKdWKFuHtzXHed1znLd9uSwenWXzHn1qcXADsSUIX8DWNrSJtnvyHRa/ZybVhJ7LAAAAbGVYSWZNTQAqAAAACAAEARoABQAAAAEAAAA+ARsABQAAAAEAAABGASgAAwAAAAEAAgAAh2kABAAAAAEAAABOAAAAAAAAAGAAAAABAAAAYAAAAAEAAqACAAQAAAABAAAAEKADAAQAAAABAAAAEAAAAADImMOoAAAACXBIWXMAAA7EAAAOxAGVKw4bAAABP0lEQVQ4EZWTv0sDQRCFLyKaKLaiwUZIoYVoJ9iIjf+F2CUGCUlnmmAj1mJj6VlYBCwEQbDRzlIsUgg26bQR7IKC4PeSuWO4IFkffDezs2/ndu9HLhpom1CDGRuPCj0MMbTHuWjxDZxBF0I0j+kcJmTW4hMl/1QT/+MYF227C6Mk7z3cwiy8QEFHCFUd45aZN5JF6hqiJUzHZtSRr5NFIQ20yxjy8AFlSJVtIPN0OjtIDgjrVtsnvlveD75BgcodPMNCfzaKVokty6+IbcvT4BssU92EEjzAIsQwCbrrHgzJN3hidhd+QE06sAZSFXT+IenMXpc2uCBOuTx96t6sPNtANd/kjXFDxb+kBvox5jIGNXkFbfszM5cM9aC/1CAG/Rgy6vP0KjJY8QXLtfgIDnNW2CFWQB9LiL4x6ZWe/gIdKjEjhctD+wAAAABJRU5ErkJggg\x3D\x3D", Scope = Public
	#tag EndConstant


	#tag Enum, Name = BorderDimensions, Type = integer, Flags = &h0
		Thin
		  Medium
		Big
	#tag EndEnum

	#tag Enum, Name = BorderStyles, Type = integer, Flags = &h0
		dashed
		  dotted
		  double
		  groove
		  inset
		  outset
		  ridge
		solid
	#tag EndEnum

	#tag Enum, Name = Symbols, Type = integer, Flags = &h0
		Arrow
		  Cross
		  Dash
		Plus
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="34"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="value"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Visual Controls"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Symbol"
			Visible=true
			Group="teccCheckbox"
			InitialValue=""
			Type="Symbols"
			EditorType="Enum"
			#tag EnumValues
				"0 - Arrow"
				"1 - Cross"
				"2 - Dash"
				"3 - Plus"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="CheckboxBorder"
			Visible=true
			Group="teccCheckbox"
			InitialValue=""
			Type="BorderDimensions"
			EditorType="Enum"
			#tag EnumValues
				"0 - Thin"
				"1 - Medium"
				"2 - Big"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderStyle"
			Visible=true
			Group="teccCheckbox"
			InitialValue="8"
			Type="BorderStyles"
			EditorType="Enum"
			#tag EnumValues
				"0 - dashed"
				"1 - dotted"
				"2 - double"
				"3 - groove"
				"4 - inset"
				"5 - outset"
				"6 - ridge"
				"7 - solid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=true
			Group="teccCheckbox"
			InitialValue="&c0096ff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarkerColor"
			Visible=true
			Group="teccCheckbox"
			InitialValue="&c0096ff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=false
			Group="Visual Controls"
			InitialValue=""
			Type="WebUIControl.Indicators"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Primary"
				"2 - Secondary"
				"3 - Success"
				"4 - Danger"
				"5 - Warning"
				"6 - Info"
				"7 - Light"
				"8 - Dark"
				"9 - Link"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
