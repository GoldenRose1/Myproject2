<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/usermaster.Master" CodeBehind="question.aspx.cs" Inherits="online_exam.question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="heardcontentplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
 <style>
        .lbhide{display:none;}

        .countdown-label {
  font: thin 15px Arial, sans-serif;
	color: #65584c;
	text-align: center;
	text-transform: uppercase;
	display: inline-block;
  letter-spacing: 2px;
  margin-top: 9px
}
#countdown{
 
width: 180px;
	height: 96px;
	text-align: center;
 
	border-radius: 5px;
	margin: auto;
    /*position: fixed;
    bottom: 0;
    margin-left: 60%;
    margin-bottom: 25%;*/
}



#countdown #tiles{
  color: #fff;
	position: relative;
	z-index: 1;
text-shadow: 1px 1px 0px #ccc;
	display: inline-block;
  font-family: Arial, sans-serif;
	text-align: center;
  
  padding: 15px;
  border-radius: 5px 5px 0 0;
  font-size: 35px;

  display: block;
    
}
 @media (max-width: 600px) {

      #countdown { 
           width: 80px;
       }
   
          
}
@media (max-width: 602px) {

     #countdown #tiles { 
           font-size:15px;
       }
   #countdown #countdown-label{font-size:12px; }
          
} 

.color-full {
  background: #53bb74;
}
.color-half {
  background: #ebc85d;
}
.color-empty {
  background: #e5554e;
}

/*#countdown #tiles > span{
	width: 70px;
	max-width: 70px;

	padding: 18px 0;
	position: relative;
}*/





#countdown .labels{
	width: 100%;
	height: 25px;
	text-align: center;
	position: absolute;
	bottom: 8px;
}

#countdown .labels li{
	width: 102px;
	font: bold 15px 'Droid Sans', Arial, sans-serif;
	color: #f47321;
	text-shadow: 1px 1px 0px #000;
	text-align: center;
	text-transform: uppercase;
	display: inline-block;
}
#tim{
    position:fixed;
    top:0;
    margin-top:5%;
     
}
#content{
    margin-top:10%;
}
        @media (max-width: 1000px) {
            #tim {
                margin-top: 10%;
                
            }
        }
        @media (max-width: 999px) {
            #content {
                margin-top: 20%;
            }
        }
            @media (max-width: 600px) {
                #tim {
                    margin-top: 15%;
                      
                }
              
            }
        @media (max-width: 599px) {
            #content {
                margin-top: 30%;
            }
        }
            @media (max-width: 380px) {
                #tim {
                    margin-top: 20%;
                    
                }
            }
                @media (max-width: 379px) {
                  #content{
                    margin-top: 45%;
                    
                }
            }

            @media (max-width: 345px) {
                #tim {
                    margin-top: 40%;
                     
                }
                
            }
               @media (max-width: 344px) {
                #content {
                    margin-top: 55%;
                     
                }
                
            }
         
         
    </style>
<div id="tim">
        <asp:Label ID="Label2" runat="server" Text="Label"  CssClass="lbhide"></asp:Label>
         <div id="countdown">
  
  <div id='tiles' class="color-full"></div>
  <div class="countdown-label"> </div>
</div>
    </div>


    <div class="a"> 
        <asp:Label ID="Label1" runat="server" Text="Label" style="display:none;"></asp:Label>
        
    </div> </div> <div id="contents"> <h2 >  Answer all the questions</h2>
    
     
    <asp:TextBox ID="getstringuser" runat="server" Visible="false"></asp:TextBox>
    <asp:GridView ID="gridview_examquestion" runat="server" AutoGenerateColumns="False" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("question_id") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lbl_question" runat="server" Text='<%# Eval("question_name") %>'></asp:Label>
                    <br />
                    <asp:RadioButton GroupName="a" Text='<%# Eval("option_one") %>' ID="option_one" runat="server" />
                    <br />
                    <asp:RadioButton GroupName="a" Text='<%# Eval("option_two") %>' ID="option_two" runat="server" />
                    <br />
                    <asp:RadioButton GroupName="a" Text='<%# Eval("option_three") %>' ID="option_three" runat="server" />
                    <br />
                    <asp:RadioButton GroupName="a" Text='<%# Eval("option_four") %>' ID="option_four" runat="server" />
                    <hr />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" />
        </div>

      <script>







          var examtime = parseInt(document.getElementById('<%=Label1.ClientID%>').textContent);
          var minutes = examtime ;

          var target_date = new Date().getTime() + ((minutes * 60) * 1000); // set the countdown date
          var time_limit = ((minutes * 60) * 1000);
          //set actual timer
          setTimeout(
              function () {
                  document.getElementById('maincontentplaceholder_btn_submit').click();

              }, time_limit);

          var days, hours, minutes, seconds; // variables for time units

          var countdown = document.getElementById("tiles"); // get tag element

          getCountdown();

          setInterval(function () { getCountdown(); }, 1000);

          function getCountdown() {

              // find the amount of "seconds" between now and target
              var current_date = new Date().getTime();
              var seconds_left = (target_date - current_date) / 1000;

              if (seconds_left >= 0) {
                  console.log(time_limit);
                  if ((seconds_left * 1000) < (time_limit / 2)) {
                      $('#tiles').removeClass('color-full');
                      $('#tiles').addClass('color-half');

                  }
                  if ((seconds_left * 1000) < (time_limit / 4)) {
                      $('#tiles').removeClass('color-half');
                      $('#tiles').addClass('color-empty');
                  }

                  days = pad(parseInt(seconds_left / 86400));
                  seconds_left = seconds_left % 86400;

                  hours = pad(parseInt(seconds_left / 3600));
                  seconds_left = seconds_left % 3600;

                  minutes = pad(parseInt(seconds_left / 60));
                  seconds = pad(parseInt(seconds_left % 60));

                  // format countdown string + set tag value
                  countdown.innerHTML = "<span>" + hours + ":</span><span>" + minutes + ":</span><span>" + seconds + "</span>";



              }



          }

          function pad(n) {
              return (n < 10 ? '0' : '') + n;
          }


</script>
    <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="panel_questshow_warning" runat="server" Visible="false">
                    <br />
                    <div class="alert alert-danger text-center">
                        <asp:Label ID="lbl_questshowwarning" runat="server" />
                    </div>
                </asp:Panel>
            </div>
        </div>

    </div>
</asp:Content>
