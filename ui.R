library(shiny)
shinyUI(pageWithSidebar(
    
    # Title
    headerPanel("Predict WHITE MALE systolic blood pressure (SBP)"),
    
    # Sidebar with slider and numeric inputs
    sidebarPanel(
        h4("Intructions"),
        helpText("Input",strong("Weight (in kgs)"),",",strong("Height (in meters)"),
        ", smoking history:",strong("SMK = 0"),"if nonsmoker,",strong("SMK = 1"),
        "if a current or previous smoker and",strong("AGE"),".",
        br(),
        br(),
        sliderInput('Weight','Weight (kgs):',min=50, max=120, value=86),
        numericInput('Height','Height (meters):', 1.73, min=1.5, max=2, step=0.01),
        numericInput('SMK','Smoker?:', 0, min=0, max=1, step=1),
        sliderInput('AGE','Age (years):',min=40,max=80,value=56)
        )),
    
    # Show the result of the prediction and a histogram as a reference
    mainPanel(
        h3('SBP Prediction'),
        p("We use a", strong("hypothetical sample"),
          "of 32", strong("white males"), "over 40 years old  from 
          the town of", strong("Angina"),"to create the model."), 
        p("The variable", strong("SBP"),"(systolic blood pressure, in
          mmHg),",strong("QUET"),"(Quetelet index = 100 * weight (kgs)
          / height (meters)^2 / 703.1), ", strong("AGE"),"(in years)
          and smoking history:", strong("SMK = 0"),"if nonsmoker", 
          strong("SMK = 1"), "if a current or previous smoker. The 
          Quetelet Index (",strong("QUET"),") is a historical metric 
          for body mass index (", strong("BMI"),"). BMI = QUET/100*703.1 
          links ",strong("QUET")," to ",strong("BMI"),"."), 
        p('The predictor uses the dataset to make predictions. It used linear regression and ',code('predict'),' function in R.'),         
        br(),
        h3('Predicted Sistolic Blood Pressure',verbatimTextOutput("prediction")),
        h3('Lower Confidence Interval',verbatimTextOutput("lwr")),
        h3('Upper Confidence Interval',verbatimTextOutput("upr")),
        p('We can get a confidence interval for the predicted value.'),
        helpText(strong("Caution:"), "We use a hypothetical white male over 40 
        years old dataset.")
        )
)
)


