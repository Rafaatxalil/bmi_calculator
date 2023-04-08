

Requirements Gathering





•	PROJECT NAME: BMI Calculator
•	PHASE: 4
•	DATE: 3/25/2023


PREPARED BY
•	Helin Ibrahim: writing and preparing the report

•	Mabasr Abdulqadir: writing and preparing the report

•	Rafaat Khalil : Developing and performing unit testing’s and some of the                 integration testing

•	Dlvin Hafeez: Performing some of the integration testing’s and system testing

•	Milad Mirkhan: Performing Identifying and tracking defects


1.	Introduction


1.1	 DESCRIPTION:
•	The BMI Calculator mobile application is designed to calculate an individual's Body Mass Index (BMI) based on their gender, age, height, and weight. BMI is a measure of body fat based on height and weight, and it is widely used to assess whether an individual is underweight, overweight, or within a healthy weight range. The application will allow users to input their information and receive an immediate BMI calculation, along with information about what the BMI number means and recommendations for achieving a healthy weight.
1.2	 PURPOSE OF PROJECT
•	The purpose of the project is to provide a user-friendly and accessible tool for individuals to monitor their BMI and work towards achieving a healthy weight. The application will be available on both Android and iOS platforms and will feature a dark and light theme for user convenience. The application will also perform calculations with both metric and imperial units to cater to users worldwide. The development of this application aligns with the current trend of health and wellness awareness and can aid individuals in making informed decisions regarding their health.

2.	Project Requirements

2.1	USER REQUIREMENTS
•	User Interface: The application should have a user-friendly interface that is easy to navigate and understand. Users should be able to input their information easily and receive clear and concise feedback on their BMI calculation.
•	Customization: Users may have different preferences and requirements, and the application should be customizable to cater to those needs. This may include the ability to switch between light and dark themes or to select the preferred unit system for calculations.
•	Accuracy: The application should provide accurate BMI calculations based on the user's input, as this is critical to the user's ability to monitor their weight and health. The accuracy of the application should be validated through rigorous testing.
•	Performance: The application should be fast and responsive, with minimal lag time between user input and calculation output. Users should not experience any significant delays or crashes while using the application.


2.2	FUNCTIONAL REQUIREMENTS
•	The application should be able to calculate the BMI of users based on their gender, age, height, and weight
•	The application should support both metric and imperial unit systems
•	The application should be able to switch between light and dark themes
•	The application should be able to display the results of the BMI calculation and interpret it
•	The application should be able to provide the user with recommendations based on the BMI calculation
•	The application should allow the user to input their data through a user-friendly interface

2.3	PERFORMANCE REQUIREMENTS
•	Response time: The app needs to react fast to user inputs like height and weight and BMI calculations. To offer a seamless and easy-to-use user experience, the response time should be almost instantaneous.
•	Memory consumption: To prevent excessive memory consumption, which can cause app crashes or poor performance, the app should have effective memory management. The application should be made to use the least amount of memory possible, preventing memory leaks and memory-intensive tasks.
•	Battery usage: The app should be built to minimize energy consumption, as high battery usage can have a negative influence on the user experience and quickly drain the device's battery.
•	UI Performance: The app's UI has to be responsive, with quick rendering and smooth animations. A smooth user experience should be achieved when scrolling, clicking, entering data, and performing other UI operations.
•	Cross Platform Compatibility: The BMI calculator app ought to behave effectively and offer a consistent experience across several platforms, including Android, iOS, and the web, if it is created to operate on multiple platforms.
•	Device Compatibility: The app should be designed to perform well on a range of devices with varying hardware specifications, including different screen sizes, resolutions, and processing power. It should be tested on different devices to ensure smooth performance across a wide range of devices.
•	The application should be able to work offline


2.4	RISK MANAGEMENT
•	Functional Requirements: If the functional requirements are not properly defined or understood, the application may not meet the users' needs. To mitigate this risk, the requirements gathering process should be thorough and include input from a variety of stakeholders.
•	Performance: If the application does not perform as expected, users may become frustrated and abandon it. To mitigate this risk, performance testing should be conducted throughout the development process to identify and address any issues.
•	Compatibility: Compatibility issues can arise if the application is not designed to work with the latest operating systems and devices. To mitigate this risk, the development team should conduct regular testing to ensure that the application is compatible with the latest platforms.
•	User Acceptance: If users do not find the application easy to use or navigate, they may abandon it. To mitigate this risk, the development team should conduct user testing throughout the development process to ensure that the application is intuitive and easy to use.


3.	High-Level Tech Architecture

•	Programming languages: The application should be developed using high-level programming language Dart.
•	Frameworks: The application may utilize framework Flutter to develop a cross-platform application.
•	IDEs: Integrated Development Environments (IDEs) such as Android Studio, Xcode, or Visual Studio Code may be used to write and debug the application code.
•	Version control: Version control system Git may be used to manage and track changes to the application code.







4.	Maintenance & Support

•	Bug Fixes: As users continue to use the application, they may encounter issues that were not identified during the testing phase. It is essential to have a process in place to identify and fix these bugs promptly to ensure that the application continues to function correctly.
•	Upgrades and Enhancements: As new features and functionality are requested by users, the development team should consider implementing them through regular upgrades and enhancements. These upgrades may include new themes, additional unit systems, or new recommendations based on BMI calculations.
•	Compatibility: The development team should ensure that the application remains compatible with the latest operating systems and devices. Regular testing should be conducted to ensure that the application works correctly on the latest platforms.

5.	Testing Strategy

5.1 UNIT TESTING
o	Objective: The team should conduct unit testing to ensure that each individual component of the application works as expected and meets the specified requirements. In unit testing, each component of the application will be tested separately to ensure that it functions correctly. This includes testing the input fields, the formula used for calculating the BMI, and the output of the calculation.
o	Users:  
	Developers are the primary users of unit tests
	Quality assurance (QA) engineers are responsible for testing the application.
o	Tasks: 
	Test case design
	Test case implementation
	Test case execution
	Test case maintenance
	Code coverage analysis
	Test reporting

5.2 WIDGET TESTING
o	Objective: is an important part of the overall testing strategy for the BMI Calculator application, as it helps to ensure that the individual components of the application are working as expected and are free from defects. By conducting widget testing, the development team can catch issues early in the development process, and ensure that the application is of high quality and meets the necessary requirements.
o	Users:  
	primary user: QA engineers
	developers
	may be product managers or designers.
o	Tasks:
	identifying defects
	verifying functionality
	ensuring usability
	testing compatibility:

5.3 INTEGRATION TESTING
o	Objective: The team should perform integration testing to ensure that all components of the application work together seamlessly and that the application as a whole meets the specified requirements. In integration testing, the different components of the application will be tested together to ensure that they communicate with each other correctly. This includes testing how the input fields interact with the formula used for calculating the BMI, and how the output of the calculation is displayed.
o	Users: 
	Primary users: developers and QA engineers
	product managers or business analysts and executives
o	Tasks: 
	Test planning
	Test design
	Test execution
	Defect tracking
	Test reporting
	Regression testing
	Test closure


5.4 SYSTEM TESTING
o	Objective: The team should conduct system testing to ensure that the application meets all functional and non-functional requirements and that it is ready for release. In system testing, the application will be tested as a whole to ensure that it meets all the requirements specified. This includes testing how the application handles different scenarios, such as edge cases and error handling, and how it performs under different conditions, such as different device specifications and network speeds. 
o	Users: 
	primary users: software developers, quality assurance (QA) engineers, and other technical professionals.
	other stakeholders may also be involved such as product managers, business analysts, project managers, and executives.
	End users, as they will ultimately be using the application
o	Tasks: 
	Defect tracking
	Performance testing
	Security testing
	Usability testing
	Compatibility testing
	Acceptance testing












Boundary Value Analysis and Test Cases

BOUNDARY VALUE ANALYSIS FOR METRIC UNIT MEASUREMENT
	Boundary value analysis for age	
invalid	valid	Invalid
0	1,2,99,100	101
	Boundary value analysis for height	
invalid	valid	Invalid
49	50,51,199,200	201
	Boundary value analysis for weight	
invalid	valid	Invalid
2	3,4,149,150	151






BOUNDARY VALUE ANALYSIS FOR IMPERIAL UNIT MEASUREMENT
	Boundary value analysis for age	
invalid	valid	Invalid
0	1,2,99,100	101
	Boundary value analysis for height	
invalid	valid	Invalid
1.5	1.6,1.6,6.4,6.5	6.6
	Boundary value analysis for weight	
invalid	valid	Invalid
6.5	6.6,6.7,330.5,330.6	330.7



Test Case ID	Test Suite Name	Description	Steps	Test Data	Expected result	Actual Result	Pass/Fail
TC_01	female without age	Testing the application setting the value of age <= 0
and gender value male	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: female 
Height: 150cm,4,9ft
Weight: 55kg,121.2lb
Age: 0	Error	Error	Pass
TC_02	male without age	Testing the application setting the value of age <= 0 and gender value male	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: male 
Height: 150cm,4,9ft
Weight: 
55kg,121.2lb Age: 0	Error	Error	Pass
TC_03  	female  without height	Testing the application setting the value of height <= 5 and gender value female	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: female 
Height: 0
Weight: 55kg,121.2lb
Age: 30	Error	Error	Pass
TC_04	male without height	Testing the application setting the value of height <= 5 and gender value male	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: male 
Height: 0
Weight: 55kg,121.2lb
Age: 30	Error	Error	Pass
TC_05	female without weight	Testing the application setting the value of weight <= 0 and gender value female	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: female 
Height: 150cm,4,9ft
Weight: 0
Age: 30	Error	Error	Pass
TC_06	male without weight	Testing  the application setting the value of weight <= 0 and gender value male	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: male 
Height: 150cm,4,9ft
Weight: 0
Age: 30	Error	Error	Pass
TC_07	female without calculating	Testing the application setting all the valid values without hitting the calculate BMI button	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
	Gender: female 
Height: 150cm,4,9ft
Weight: 55kg,121.2lb
Age: 30	Shows nothing	Shows nothing	Pass
Test Case ID	Test Suite Name	Description	Steps	Test Data	Expected result	Actual Result	Pass/Fail
TC_08	male without calculating	Testing the application setting all the valid value without hitting the calculate BMI button	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
	Gender: male 
Height: 150cm,4,9ft
Weight: 55kg,121.2lb
Age: 30	Shows nothing	Shows nothing	Pass
TC_09	Female gender with normal BMI	Testing the application with normal value to get normal body weight message	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: female 
Height: 150cm,4,9ft
Weight: 55kg,121.2lb
Age: 30	Success message	Success message	Pass
TC_10	Male gender with normal BMI	Testing the application with normal value to get normal body weight message	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: male 
Height: 150cm,4,9ft
Weight: 55kg,121.2lb
Age: 30	Success message	Success message	Pass
TC_11	Female gender with high BMI	Testing the application with high weight value to get higher body weight message	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: female 
Height: 150cm,4,9ft
Weight: 75kg,165.3lb
Age: 30	BMI >= 25	BMI >= 25	Pass
TC_12	Male gender with high BMI	Testing the application with high weight value to get higher body weight message	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: male 
Height: 150cm,4,9ft
Weight: 75kg,165.3lb
Age: 30	BMI >= 25	BMI >= 25	Pass
TC_13	Female gender with low BMI	Testing the application with low weight value to get lower body weight message	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: male 
Height: 150cm,4,9ft
Weight: 88.18lb,40kg
Age: 30	BMI <= 20	BMI <= 20	Pass
TC_14	Male gender with low BMI	Testing the application with low weight value to get lower body weight message	1-choose the gender. 2- choose the height. 3-choose the weight. 4-choose the age.
5- hit the calculate BMI button.	Gender: male 
Height: 170cm,5.57ft
Weight: 50kg,110.2ft
Age: 21	BMI <= 20	BMI <= 20	Pass

6.	Defect Tracking and Resolution

6.1	DEFECT IDENTIFICATION
Objective: During testing, the team should identify any defects found in the application. These defects can be found through various means, such as manual testing and automated testing.
DEFECT PRIORITIZATION
Objective: The development team should prioritize the defects based on their severity and impact on the application. This will help them to determine which defects need to be fixed first.
 DEFECT FIXING
Defect identification	Severity level	Resolve process
when we click of field of age, weight, height it cannot be changed	 low	Add text field instead a number 
when we change the numbers with buttons it set state all the widgets	high	Now the state it managed and only the widget changes
when calculating the BMI it didn’t show the message only in dark mode	high	We specify the colors and now it shows perfectly
we only have Meters for height and KG for weight	low	We add pound and inch
When user changes units,       measurement go back to default	            Medium	              We added unit changer from     metric to imperial and vice versa
Not showing recommendation and states on message	low	We add recommendation and states to message
The widgets overflow the screen 	Medium 	We add the size of widgets according to screen size
• Objective: The development team should fix the defects based on their prioritization. Once a defect has been fixed, the team should conduct regression testing to ensure that the fix did not introduce any new defects.



Conclusion

So to wrap it up , the BMI calculator is a useful tool that can determine our weight in relation to our height. It's simple to use and can give us a sense of whether we're underweight, regular weight, overweight, or obese. However, it is crucial to realise that it is not perfect and does not take into account variables like how much muscle we have or how our bones are constructed. It's only a beginning point for talking to our doctors or other medical professionals about our weight and health. It is critical to combine it with other data to obtain a complete picture of our health. Scientists are constantly trying to improve it, but for now, it's a useful tool to help us start thinking about our weight and health.


