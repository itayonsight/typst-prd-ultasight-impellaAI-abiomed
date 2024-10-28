#import "@preview/fletcher:0.3.0" as fletcher: node, edge
#import "@preview/diagraph:0.2.0" as diagraph
#import "@preview/tablex:0.0.7": tablex, hlinex, vlinex
#import "@preview/gentle-clues:0.6.0" as clues
#import "@preview/wrap-it:0.1.0": wrap-content
#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx, cellx


#import "alg_template.typ": *
#import "fletcher/all_figures.typ" : draw_context_fig_1, draw_calibration_process_diag, draw_modification_diag, draw_parameter_scan_diag, draw_threshold_determining, draw_timeline_diag, draw_timeline_diag_with_transformation

#show: doc => template_func(
  title: [#useg - PRD],
  version: [1.0],
  document_id : [DOC-00035],
  doc,
)

// #pagebreak(weak: true)

= Product Overview
<sec-objectives> 


== Product / Feature name
#clues.info[Must be decided before handoff to dev / alg teams]
#useg

== Abbreviations 
#clues.info[List of terms and theirs definition]

#show figure: set block(breakable: true)

#figure(
  kind: table,
  [
  #set text(size: 10pt, hyphenate: false)
  #set align(left)
  #set par(justify: false)
    


#tablex(
  columns: (20pt, 1fr,3fr),
  align: left + horizon,

  // indicate the first two rows are the heder
  // (in case we need to eventually
  // enable repeating the header across pages)
  header-rows: 1,

  // row number
  map-cells: cell => {
    if cell.x == 0 and cell.y > 0 {
      cell.content = {int(cell.y)}
    }
    cell
  },
  
  // color rows based on their columns
  map-rows: (row, cells) => cells.map(c =>
    if c == none {
      c  // keeping 'none' is important
    } else {
      (..c, fill: if row < 1 { rgb(0, 255, 151) } )
    }
  ),
  
  [*\#*], [*Abbreviation*], [*Definition*],
  [], [A3C], [Apical Three Chambers],
  [], [A5C], [Apical Five Chambers],
  [], [AIC], [Abiomed Impella Controller],
  [], [AI], [Artificial Intelligence],
  [], [APP], [Advanced Practice Provider],
  [], [AxM], [Auxiliary Monitor],
  [], [BMI], [Body Mass Index],
  [], [CICU], [Cardiac Intensive Care Unit],
  [], [DICOM], [Digital Imaging and Communications in Medicine],
  [], [FDA], [Food and Drug Administration],
  [], [GDPR], [General Data Protection Regulation],
  [], [HIPAA], [Health Insurance Portability and Accountability Act],
  [], [HRPCI], [High-risk Percutaneous Coronary Intervention],
  [], [ICU], [Intensive Care Unit],
  [], [KPI], [Key Performance Indicator],
  [], [LTTE], [Limited Transthoracic Echocardiography],
  [], [LVOT], [Left Ventricle Outflow Tract],
  [], [NPS], [Net Promoter Score],
  [], [Pacs], [Picture Archiving and Communication System],
  [], [PHI], [Protected Health Information],
  [], [PLAX], [Parasternal Long Axis],
  [], [POC], [Proof of Concept],
  [], [PRD], [Product Requirements Document],
  [], [RLM], [Remote Link Management],
  [], [SaMD], [Software as a Medical Device],
  [], [TTE], [Transthoracic Echocardiography],
  [], [V&V], [Verification and Validation],
)],
  caption: [Abbreviations Table.])





== Value Justification
#clues.info[Why this product is being developed. Focus on the problem definition and describe the solution. Include motivation from the user and the business perspective]

*Unique Value proposition*

Currently, bedside echocardiography for positioning the #tmi requires specialized training, limiting its application to hospitals with 24/7 sonographer services and potentially leading to sonographer burnout due to workload. This poses a significant barrier in healthcare settings lacking these services and can affect patient outcomes. 
	
The #useg system addresses this issue by identifying the aortic annulus and the #tmi inlet, and measuring the distance between them. This automates and simplifies the process of Limited Transthoracic Echocardiography (LTTE) for #tmi positioning,.The combination of this ability together with the FDA approval Guidance feature, assisting any non-expert user to reach a high quality echo view, is making it accessible to personnel with less specialized training.
	
By eliminating the need for a specialized sonographer to perform LTTE, the #useg system can extend the use of #tmis to a broader range of hospitals. This can also reduce the workload of existing sonographers, potentially mitigating burnout.
	
Ultimately, the #useg system aims to improve patient outcomes and enhance operational efficiency by facilitating the process of #tmi positioning and monitoring, thereby democratizing access to these crucial healthcare services. 


== Intended Users
#clues.info[List of potential users. Include information about their environment. Specify the Intended Use and Indications for Use]

The #useg is a Software as a Medical Device (SaMD) intended for medical professionals operating in clinical settings where patients necessitate #tmis. This includes cardiologists, intensivists, anesthesiologists, interventional cardiologists, nurses, nurse practitioners, physician assistants, and sonographers.

These professionals often work in environments such as Intensive Care Units (ICUs), where the correct and efficient positioning of #tmis is crucial. The #useg is designed to evaluate the position of the #tmi by automating the identification and measurement of cardiac structures in relation to #tmis, including the distance between the #tmi's inlet and other cardiac structures, using ultrasound clips.

It is intended for use during echocardiography procedures across various clinical settings, including ICUs, Cardiac Intensive Care Units (CICUs), cardiac units, operating rooms, and other locations where patients require #tmis.

== Target Population
#clues.info[Specify the patient population relevant for this product]

The #useg system is intended for adult patients who require #tmis for cardiac support. This includes:

- Patients of any gender.
- Patients with any body mass index (BMI).


*Inclusion Criteria*:

- Patients aged 18 and above.
- Patients in need of #tmis for cardiac support.

*Exclusion Criteria*:

- Patients below the age of 18.


== User Stories
#clues.info[List of use cases, ordered by their usage frequency. 

Write using this format:

"As a [user role], I want to [do something], so that i can [achieve a goal]"]

Each story focuses on specific phase of the system's operation, from initial scanning to reviewing and analyzing the data:

- *Echo Scanning*: As a medical professional (#eg Advanced Practice Provider, Physician, Registered Nurse, Sonographer), I want to place the ultrasound probe on the patient's chest while the #useg system monitors the incoming ultrasound stream. If needed, I can use the FDA approved guidance system @FDA_Clearance_K223347 to get to specific views.

- *Preview*: As a medical professional, I want the #useg system to identify and display key structures (#eg #tmi's inlet, aortic annulus) within the ultrasound images during scanning so that I can feel comfortable to further analyze this clip for device positioning.

- *Clip/Frame Saving*: 
  - As a certified medical professional (#eg Sonographer), I want to either freeze the live ultrasound image or capture a short clip for detailed review. This helps in documenting and further analyzing the device position.
  - As a novice user, I prefer recording a clip for further analysis by a certified user later.

- *Measurement*: 
  - As a physician or a certified user, I want to measure the distance between the #tmi's inlet and the aortic annulus within the recorded clips. This assists in making informed decisions about the patient's care and ensures the accuracy of the data.
  - As a novice user, I wish to have a measurement of a stored clip so a certified user can review.

- *Review*: 
  - As a certified user, I want to review and, if necessary, modify the measurements and identifications provided by the #useg system. This ensures accuracy and reliability of the data.

#pagebreak(weak: true)
  
= Functional Requirements
#clues.info[A prioritized list of features, including mandatory and optional features. If a requirement is optional it would start with "[Optional]". If we plan multiple phases, separate the list into multiple lists by phase.

Each line in the list would look like this: "[Actor] should be able to [action] in order to [result]". The actor could be either a user or a system (internal or external). The results could be either a UI result for users or a technological result for systems.

The requirements should cover all positive flows and add any negative flow you can think about in order to handle exceptions / errors correctly during development]

- *Preview*:
  - *Structure Identification*: Structures within the 'ultrasound fan' are displayed if they meet acceptability criteria, which is defined as visibility and stability for at least 300 milliseconds within the past one second, supporting quantitative imaging.
  - *Acceptability Definition*: A prediction is considered acceptable if it meets both visibility and stability criteria, supporting reliable identification.
  - *Negative Flow Handling*: If the acceptability criteria are not met, structures will not be marked.

- *Clip/Frame Saving*:
  - *General Functionality*: Users operate the ultrasound's inherent capabilities to record clips or freeze frames.
  - *Freeze Mode*: Users can freeze images, scroll through frames, and use ultrasound inherent calipers to perform manual annotations and measurements. Users have the option to show/hide/edit or discard AI-generated measurements. Users can export a single image to disk, an additional DICOM file will be automatically generated. Upon triggering a measurement or annotation, a pop-up will prompt the user to confirm if they want to hide the AI identifications, as AI overlays must be removed to proceed with manual measurements.
  - *Clip Recording Mode*: User saves a clip for clinical evaluation.
  - *Export Functionality*: Users can export both frozen images and recorded clips directly to a local folder during the scanning process.
  - *Negative Flow*: If a freeze results in a timeframe too short for reliable identification, no identifications are displayed, and a prompt advises extending the duration.
  - *Configuration Check*: Users must verify the proper configuration of the export destination to ensure accurate functionality.

- *Measurement*:
  - *Overview*: Evaluates saved clips for acceptability. Identifications are applied across the clip.
  - *AI Data Injection into DICOM*: AI-generated measurements and identifications are automatically integrated into DICOM files without user approval.
  - *Acceptability Criteria*: Clips are acceptable is they meet both visibility and stability for at least 300 consecutive milliseconds.
  - *Measurement Calculation*: Calculates distances between identified structures in acceptable clips.
  - *Pumps Tracking*: Record the pump ID used during the scan and include it in the DICOM file.
  - *Negative Flow Handling*: If a clip is unacceptable, no measurement is calculated, and users are advised to perform another scan.

- *Review*:
  - *Overview*: Provides a list of all clips and still images captured during an exam, displaying measurements or indicating ‘N/A’ for unacceptable clips with explanations for their unacceptability. Also enables access to other exams stored on the device.
  - *AI Interactions*:
    - *Discarding AI Results*: Users may discard AI results. This event should be written in the dcm.
    - *AI Re-Analysis*: Users may present the analysis on clips where AI results have previously been discarded.
  - *Functionalities*:
      - *Clip and Frame Review*: Displays identifications and measurements for acceptable clips and frames.
      - *Playback*: Play/pause function for clip playback. When the clip is playing, only identifications will be displayed. Pausing the clip will reveal the measurement as well. Additionally, users can gently browse through the clip using a +/- control for detailed frame inspection.
      - *Measurement Display*: Shows measurement for each qualifying clip or frame.
      - *Manual Annotation and Measurement*: Users can add manual annotations and measurements, which are saved in new DICOM files. Users can remove the AI annotations from a given frame if desired, it will not be shown, and will be logged in the DICOM file. Users can edit AI identifications. These edits are treated as manual annotations, differentiated visually from AI-generated data, and logged in the DICOM file.
      - *Export*: Exports modifications and manual annotations; external exports require PHI scrubbing.
  - *Negative Flow Handling*: If clips are unacceptable, AI data isn't shown, but the clips and frames remain accessible.

- *End-Exam Feature*:
  - *Functionality*: Located within the ultrasound interface, this button finalizes the scanning session, ensuring all data is properly saved and archived. It is recommended for activation after the review phase or upon the user's decision to conclude a session.


@fig-device_description illustrates the different phases the user will encounter using #useg.

#figure(image("figures/device_description.png", width: 500pt),caption: [#useg device description.])<fig-device_description>

== Design Specs
#clues.info[Link to Figma, add descriptions of the UI behavior if needed]

=== Preview Phase
- *Interactive Controls*:
  - *Toggle Identification*: A single button controls the visibility of both the #imp's inlet identification and the aortic annulus identification. This setting is adjustable in the system settings.

- *Markers*:
  - *Inlet Identification*: Marked by a circle for clarity and quick recognition.
  - *Aortic Annulus Identification*: Marked by an elongated bar with endpoints to clearly delineate the annulus.
  - *Color Scheme*: Both markers use UltraSight green ([0, 255, 151]) for visual consistency.

- *Pop-Up Notifications*:
  - *Description*: Notifications appear on-screen during the preview phase, providing updates about the ongoing processes and outcomes.
  - *Examples of Notifications*: "Measurement: 3.4 cm", "Clip unacceptable: Re-scan needed", "Analysis in progress".

- *Clips Measurement Area*:
  - *Description*: Displays measurement results for analyzed clips, configurable to display only acceptable clips or all clips.
  - *Interaction*: Users can initiate clip review directly from this area by pressing on the clip itself or by activating the "Review" mode. Real-time feedback on clip status is provided.
  - *Review Button*: Changes color to indicate new clips or frames are available for review.


#figure(image("figures/Preview-design.png", width: 400pt),caption: [Preview phase proposed design. Note that the final UI might be slightly different.])<fig-preview-design>


=== Review Phase
- *Clips and Frames List*:
  - *Overview*: Provides a list of clips and frames with their measurements if exist. 
  - *Interaction*: Supports the viewing, analyzing, and adjusting of clips.

- *Review Tools*:
  - *Manual Measurement and Annotation on Frames*: Enables users to manually measure distances and add annotations on individual frames within clips. These annotated frames can be saved and exported as DICOM files. Manual measurements are differentiated visually from AI-generated data.
  - *Discard and Re-Run*: Allows users to discard previous AI results and rerun the AI analysis.

- *Navigation*:
  - *Return to Scanning*: Provides an easy way for users to return to the scanning phase.

- *Feedback and Notifications*:
  - *Real-Time Feedback*: Delivers immediate feedback on user actions regarding clip status and modifications, enhancing the user experience.

#figure(image("figures/Review-design.png", width: 400pt),caption: [Review design. Note that the final UI might be slightly different.])<fig-review-design>

== Integration Considerations


=== Retrieve Pump IDs from Impella Cloud:
- Implement functionality to retrieve a list of pump IDs associated with the current department from the Impella Cloud.
- Display the available pump IDs to the user for selection. See @fig-support-messages - right for an illustration.
- Before starting, ask if the user wants to continue with the pump ID that is stored.

=== Data Exchange with Impella Cloud:
- *Sending Data*:
  - Enable the system to send DICOM files and MP4 videos to the Impella Cloud.
  - Ensure that the MP4 files can be presented in the Impella Connect app along with the Impella signals.
- *Receiving Data*:
  - Implement the ability to receive DICOM files along with alarm data (and non-PHI data, #eg impella type, age, gender, BMI, sex) from the Impella Cloud to analyze key performance indicators (KPIs).


=== User Guidance and Recommendations:
- Once the charger is disconnected, provide recommendations for the appropriate probe.
- Implement prompts or notifications to guide the user through the next steps efficiently. See @fig-support-messages - left for an example reminding the user to charge the tablet.




=== Writing Pseudonymized DICOMs:
- *AI Measurements Export*: Export DICOM files enhanced with AI-derived measurements, ensuring removal of all Protected Health Information (PHI).
- *System Integration*:
  - Ensure the system can read data from a single tablet and correctly associate this data with the specific AxM unit via the pump ID.
  - If no direct connection to an AxM is available, route pseudonymized DICOM files to the UltraSight cloud via WiFi or Remote Link Management (RLM), and then to the Impella Connect cloud (or vice versa).
  - re-identification process will occur only within the hospital’s PACS using a unique key stored securely within the hospital’s system.

#figure(image("figures/support-messages.png", width: 400pt),caption: [Examples illustrating the support messages that help the user throughout the exam.])<fig-support-messages>

  
== Microcopy
#clues.info[Buttons names, onboarding text (presenting the feature for the first time), error messages and warnings, hover tooltips, disclaimers, titles. 

Final layout should be taken from the Figma files.]

=== Preview

- Show / Hide Inlet Identification: 
  - Button Name: Toggle Inlet Identification
  - Tooltip: Show or hide the identification of the inlet.

- Show / Hide Annulus Identification:
  - Button Name: Toggle Aoric Annulus Identification
  - Tooltip: Show or hide the identification of the aortic annulus.

- Clips Measurement Area:
  - Region Name: Clip Info Area
  - Description: Displays the distance information for the latest / best visible (configurable) number (configurable) clips. This list is also configurable (show/hide).
  - Interaction: Pressing on a clip in the list will move to the review phase.
  - Configuration:
    - Only show clips where both the inlet and annulus are visible, and the distance is measured.
    - Clips with manual measurements will be displayed with the measurement in black.
    - Clips with AI-generated measurements will be displayed with the measurement in green.

- Review Button (should resides in the Clips Measurement Area):
  - Button Name: Review
  - Tooltip: Enter the review phase to analyze and adjust the clip measurements.
  

=== Review


- Clips Bar:
  - Description: Clips bar located in the left column or bottom row (configurable like Lumify).
  - Tooltip: Browse through recorded clips.

- Play / Pause Button: 
  - Button Name: Play / Pause
  - Tooltip: Play or pause the current clip.
  - Interaction: The user should be able to play and pause the clip by pressing the button or tapping the screen.

- Slider:
  - Tooltip: Drag to navigate through the clip.
  
- Show / Hide Identification:
  - Button Name: Toggle Identification
  - Tooltip: Show or hide the identification markers for the inlet and aortic annulus on the clip.

- Show / Hide Measurement:
  - Button Name: Toggle Measurement
  - Tooltip: Show or hide the measurement data on the clip.
  - Note: The measurement is shown on the screen only while the clip is paused.
  
- Clip Measurement Area:
  - Region Name: Measurement Score
  - Description: Displays the measurement of the clip.

- Approve / Reject Measurement (optional):
  - Button Names: Approve Measurement, Reject Measurement
  - Tooltip: Approve or reject the AI-generated measurement.

- Manual Measurement:
  - Button Name: Manual Measurement
  - Tooltip: Switch to manual measurement using calipers.
  - Action: When the physician selects Manual Measurement, it triggers a rejection of the AI measurement. All AI-generated data vanishes, and the physician can place manual calipers. This action writes in a DICOM field that it was an override. The user must approve the rejection of the AI measurement to proceed with the manual measurement.



== Onboarding
#clues.info[If the user requires any kind of pop-up message or guidance, please specify it here]

- *Welcome Message*:
  - Text: "Welcome to #useg. This tool helps in identifying and measuring key structures related to the #imp device using AI technology."

- *Getting Started*:
  - Text: "To begin, connect the ultrasound probe to the tablet and place the probe on the patient's chest. Select 'Start Scan' to initiate the ultrasound scan."

- *Feature Introduction*:
  - Text: "During the scan, the system provides real-time identification of the inlet and annulus. You can freeze the image to inspect individual frames and view the identifications and measurements. For clips that are recorded, you can review the clips, view identifications, measurements, and use manual calipers if needed. The measurement area shows the measurements of the clips."

- *Tips for Use*:
  - Text: "Ensure the probe is properly positioned to get clear visibility of the relevant structures. Use the 'Toggle Identification' buttons to show or hide the inlet and aortic annulus identifications during the scan."

- *Support Information*:
  - Text: "For detailed instructions or troubleshooting, refer to the user manual or contact our support team."

== Backwards Compatibility
#clues.info[If there is an identified backwards compatibility risk, specify it here]

Not applicable.

== Error Handling
#clues.info[Add any specific requirements for handling errors and their display to the user]

- *Error Detection*:
  - The #useg system automatically detects and reports errors related to its functionality, such as data processing and AI analysis.
  - Examples: Failure to process images, inability to generate AI measurements, discrepancies in measurement data.

- *User Notifications*:
  - Users receive immediate, clear, and actionable alerts on the user interface for any operational errors.
  - Examples: "Error processing images. Please restart the scan.", "AI measurement failed. Please rescan the patient."

- *Logging*:
  - All errors are logged with detailed information to aid troubleshooting and debugging, facilitated by the crashlytics platform by Google.
  - Performance metrics like processing speed and system responsiveness are also continuously monitored and logged.
  - Examples: Error type, timestamp, system state, and steps leading to the error.

- *Recovery Options*:
  - The system provides users with options to recover from errors whenever possible.
  - Examples: Retry image processing, use manual measurement options, restart the #useg application.

- *Support Instructions*:
  - In cases where immediate recovery is not possible, users are provided with instructions on how to contact support for assistance.
  - Examples: "Please contact technical support at [support email/phone number] for further assistance."

== Feature Flags
#clues.info[If we are planning to use a feature-flag or some other controlled-release mechanism this would be the place to indicate it]

Not applicable.

#pagebreak(weak: true)

= Non Functional Requirements
#clues.info[Provide specifications about the product operation, like performance, security, usability, and reliability, rather than specific behaviors or functionalities]


== Performance Requirements
#clues.info[All relevant requirements in terms of performance, accuracy AI and non-AI related. Please specify (if applicable) the testing procedures and datasets]


=== Software Performance 
- *Preview Phase*: The time gap from image capture to markings should not exceed 100#sub[ms]. This ensures real-time responsiveness and user-friendly interaction.
- *Review Mode*: The time gap from image capture to the display of predictions should be no more than 50#sub[ms]. This is because the Review Mode should not involve an additional prediction step, thus requiring less processing time.

=== Algorithm Performance 

The success criterion for #useg identifications is set at 1 cm, corresponding to the physical length of the Impella inlet. This standard ensures that #useg identifications align with the necessary dimensions for effective device placement, supporting clinical decision-making within the constraints of ultrasound technology.

#figure(image("figures/Impella-cp.png", width: 400pt),caption: [#imp-cp dimensions.])<fig-impella-cp>

*Key Aspects to be Evaluated*:

- *Acceptability Predictor*: Utilizes binary classifiers for the inlet and aortic annulus, a clip is considered acceptable if it is stable and visible for at least a 300#sub[ms].
- *Inlet Identification*: Compares the algorithm’s inlet identification against annotations made by experienced sonographers.
- *Annulus Identification*: Assesses the algorithm’s annulus identification against annotations made by experienced sonographers.


*Establishment of Ground Truth*:
- The ground truth is determined by the labels annotated by at least two sonographers on echo clips. In cases where there is no agreement between the two, a third independent sonographer will review the clips to break the tie. This ensures that the ground truth data is reliable and consistent.
- Each annotator reviews one clip at a time, marking frames that display the Impella inlet and aortic annulus. These annotations determine the visibility and stability of the clip.
- These annotators are certified sonographers with at least 5 years of experience in echocardiography and at least 1 year of scanning #tmi patients. 

*Data Requirements*:

The algorithm should be trained and tested on retrospective data from a diverse patient distribution in terms of age, gender, and BMI. Clips should be stationary, with a length between 1 and 3 seconds.

- Patients with an #imp, with both the inlet and Aortic Annulus visible.
- Patients with an #imp, with neither the inlet nor the Aortic Annulus visible.
- Patients with an #imp, where either the inlet is visible and the Aortic Annulus is not, or vice versa.
- Patients without an #imp, where the Aortic Annulus is visible (in the PLAX area).
- Patients without an #imp, where the Aortic Annulus is not visible (in the PLAX area).
- Patients without an #imp, with non-PLAX clips.

*Test Execution*: 

The performance testing will utilize a dataset geographically separated from the training set to prevent bias and ensure that the system generalizes well to new data.

*Data Analysis*: 

Statistical analysis will be applied to compare and score the predictions made by the #useg System for #imp against the ground truth labels.


== Regulatory requirements
#clues.info[Specify all requirements in order to comply with FDA and others]

- *FDA Clearance*: We plan to secure clearance through a 510(k) submission, using a predicate device for to demonstrate substantial equivalence.
- *Retrospective Data*: We will use retrospective images data of diverse patients distribution to establish the system's performance and safety. 
- *Documentation*: Comprehensive documentation, including risk analysis, validation reports, and user manuals, will be prepared and submitted as part of the 510(k) application.


== Risk Description
#clues.info[Provide description on the risk and specify the risk score (if applicable) negligible, minor, moderate, major, critical]

See dedicated risk analysis document.

== License Management
The app will come pre-installed with a basic license. A license manager will be included to enable the activation of additional features as needed.

#pagebreak(weak: true)

= Analytics

== KPIs
#clues.info[Define the metrics for the success of the product, how would we measure it and the reason to monitor]

The KPIs section outlines the key performance indicators that will be used to measure the success and impact of the #useg system. The KPIs focus on the most important aspects that drive adoption and demonstrate the value of the system to Abiomed and its customers.

+ *Quality - AI Measurement Accuracy*

    - *Definition*: 5% of scans with measurements are randomly selected for review. The KPI measures the percentage of AI-generated measurements that are agreed upon by a central (UltraSight)  cardiologist, within a defined acceptable range of variability.

    - *Target*: AI-generated measurements should be agreed upon by the central (UltraSight) cardiologist at least 80% of the time, with variability within the specified range.

    - *Requirement*: Abiomed to share all scans uploaded to the Abiomed cloud with the UltraSight cloud.

    - *Reasoning*: This KPI ensures that the #useg's measurements are consistently accurate and validated by expert cardiologists, enhancing trust in the technology. Sharing this data with end users helps build confidence in the AI, assuring them that it meets high clinical standards and supports accurate decision-making.

+ *Quality – Ability to Measure the Distance Between Landmarks*

    - *Definition*: Measures the system's ability to successfully identify and measure the distance between anatomical landmarks during scans.

     *Target*: The system should successfully measure the distance between landmarks in more than 80% of applicable exams.

    - *Requirement*: Ensure that scans not intended for Abiomed are excluded from this KPI.

    - *Reasoning*: This KPI ensures the AI's functionality is reliable in measuring key anatomical distances, which is critical for procedural accuracy and clinical decision-making.

+ *Quality - System Downtime*

    - *Definition*: Tracks the percentage of time the UltraSight system is operational and available for use.

    - *Target*: System downtime should be less than 10%, ensuring over 90% system availability.

    - *Reasoning*: Maintaining a high level of system uptime is critical for supporting continuous clinical operations and minimizing disruptions in patient care.

+ *Quality - Training Time for New Users*

    - *Definition*: Measures the average time required for new users to become proficient in using the UltraSight system.

    - *Target*: The average training time for new users should be less than 1 month from start training to competency.

    - *Requirement*: Implement effective training programs and user-friendly interfaces to facilitate quick onboarding.

    - *Reasoning*: This KPI ensures that the system is user-friendly and that onboarding processes are efficient, minimizing training costs and allowing users to begin using the system effectively in a shorter time frame. Reducing training time can increase user adoption rates and overall satisfaction.

+ *Value - User Satisfaction (Net Promoter Score)*

    - *Definition*: Measures overall user satisfaction with the UltraSight system using the Net Promoter Score (NPS) methodology.

    - *Target*: Achieve an NPS score of 60 or higher.

    - *Requirement*: Conduct regular user satisfaction surveys and analyze feedback to identify areas for improvement.

    - *Reasoning*: This KPI gauges overall user satisfaction and loyalty, providing insights into users' willingness to recommend the system to others. It helps identify strengths and areas needing improvement, guiding enhancements to the user experience and fostering user engagement.

+ *Value – Position Alarm to Scan Start Time*

    - *Definition*: Measures the time between when a position alarm is triggered and when the scan is initiated.

    - *Target*: The time from position alarm to scan initiation should be less than 15 minutes in 80% of cases.

    - *Requirement*: Abiomed is required to share alarm data with UltraSight via cloud integration to track and analyze this KPI.

    - *Reasoning*: This metric serves as a proxy for assuming that UltraSight enables a shorter time from alarm to repositioning, without directly measuring the repositioning time. By focusing on scan initiation, the process indirectly supports faster clinical response to position alarms.





= Timeline

== Deadlines and Rollout Plan
#clues.info[Specify specific deadlines or commitments. Describe the user rollout plan and its timelines. Please indicate if the product / feature is rolled to all sites and / or user-roles. If there are phases, please specify their high-level timeline]

See dedicated project plan document.

#pagebreak(weak: true)


#bibliography("alg_template.bib")
