# The name of this view in Looker is "Sales Activities"
view: sales_activities_engagement {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{SFDC_DATASET}.SalesActivities`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account ID" in Explore.

  dimension: account_id {
    type: string
    sql: ${TABLE}.AccountId ;;
  }

  dimension: account_industry {
    type: string
    sql: ${TABLE}.AccountIndustry ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.AccountName ;;
  }

  dimension: activity_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.ActivityId ;;
  }

  dimension: opportunity_owner {
    type: string
    sql: ${TABLE}.OpportunityOwnerName ;;
  }


  dimension: activity_owner {
    type: string
    sql: ${TABLE}.ActivityOwnerName ;;
  }

  dimension: activity_type {
    type: string
    sql: ${TABLE}.ActivityType ;;
  }

  # dimension: avg_follow_up_contact_rate {
  #   type: number
  #   sql: ${TABLE}.Avg_Follow_Up_Contact_Rate ;;
  # }

  # dimension: count_active_engagements_least10 {
  #   type: number
  #   sql: ${TABLE}.Count_Active_Engagements_Least10 ;;
  # }

  # dimension: count_active_engagements_top10 {
  #   type: number
  #   sql: ${TABLE}.Count_Active_Engagements_Top10 ;;
  # }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ActivityCreatedDatestamp ;;
  }

  dimension_group: end_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ActivityEndDate ;;
  }

  dimension: is_closed {
   type: yesno
   sql: ${TABLE}.OpportunityIsClosed ;;
  }


#Using a separate flag for boolean values as Looker considers NULL values in "Boolean" coloumns
#as a No when using YesNo type dimensions
dimension: is_closed_flag {
  type: string
  sql: CASE
         WHEN ${TABLE}.OpportunityIsClosed THEN 'Yes'
         WHEN NOT(${TABLE}.OpportunityIsClosed) THEN 'No'
         ELSE 'Null'
       END;;
}


   # dimension: is_closed {
    #  type: yesno
    #  sql:
  #  'Yes': ${TABLE}.IsClosed = 'true'

  #  'No': ${TABLE}.IsClosed = 'false'

  #  'Null': ${TABLE}.IsClosed = NULL ;;
  #  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}.OpportunityIsWon ;;
  }


#Using a separate flag for boolean values as Looker considers NULL values in "Boolean" coloumns
#as a No when using YesNo type dimensions
  dimension: is_won_flag {
    type: string
    sql:  CASE
         WHEN ${TABLE}.OpportunityIsWon THEN 'Yes'
         WHEN NOT(${TABLE}.OpportunityIsWon) THEN 'No'
         ELSE 'Null'
       END;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.LeadIsConverted ;;
  }

  #Using a separate flag for boolean values as Looker considers NULL values in "Boolean" coloumns
  #as a No when using YesNo type dimensions
  dimension: is_converted_flag {
    type: string
    sql:  CASE
         WHEN ${TABLE}.LeadIsConverted THEN 'Yes'
         WHEN NOT(${TABLE}.LeadIsConverted) THEN 'No'
         ELSE 'Null'
       END;;
  }




  dimension_group: last_activity {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    sql: ${TABLE}.LastActivityDate ;;
  }

  # measure: last_activity_date2 {

  #   type: date

  #   sql: MAX(${created_date_date}) ;;

  #   convert_tz: no

  # }


  dimension: lead_name {
    type: string
    sql: ${TABLE}.LeadName ;;
  }

  # dimension: neglected_opportunities {
  #   type: number
  #   sql: ${TABLE}.Neglected_Opportunities ;;
  # }

  # dimension: opportunities_with_passed_closed_date {
  #   type: number
  #   sql: ${TABLE}.Opportunities_With_Passed_Closed_Date ;;
  # }

  dimension: opportunity_account_id {
    type: string
    sql: ${TABLE}.OpportunityAccountId ;;
  }

  # dimension: opportunity_amount {
  #   type: number
  #   sql: ${TABLE}.OpportunityAmount ;;
  # }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_opportunity_amount {
  #   type: sum
  #   sql: ${opportunity_amount} ;;
  # }

  # measure: average_opportunity_amount {
  #   type: average
  #   sql: ${opportunity_amount} ;;
  # }

  dimension_group: opportunity_closed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: date
    sql: ${TABLE}.OpportunityClosedDate ;;
  }

  # dimension: opportunity_completed_activity_analysis {
  #   type: number
  #   sql: ${TABLE}.Opportunity_Completed_Activity_Analysis ;;
  # }

  dimension_group: opportunity_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.OpportunityCreatedDatestamp ;;
  }

  dimension: opportunity_expected_value {
    type: number
    sql: ${TABLE}.OpportunityExpectedValue ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.OpportunityId ;;
  }

  dimension: opportunity_name {
    type: string
    sql: ${TABLE}.OpportunityName ;;
  }

  # dimension: opportunity_open_activity_analysis {
  #   type: number
  #   sql: ${TABLE}.Opportunity_Open_Activity_Analysis ;;
  # }

  dimension: opportunity_owner_id {
    type: string
    sql: ${TABLE}.OpportunityOwnerId ;;
  }

  dimension: activity_owner_id {
    type: string
    sql: ${TABLE}.OwnerId ;;
  }

  measure: count_activity_Owner {
    type: count_distinct
    sql: ${TABLE}.OwnerId ;;
    value_format: "#,##0"
  }

  measure: count_activity {
    type: count_distinct
    sql: ${TABLE}.ActivityId ;;
    value_format: "#,##0"
    #link: {
     # label: "Opportunity Activities Detail Report"
    #  url: "https://cortex.cloud.looker.com/dashboards/666?Created+Date={{_filters['sales_activities_engagement.opportunity_created_date']}}&Country={{_filters['sales_activities_engagement.billing_country']}}&Stage={{_filters['sales_activities_engagement.opportunity_stage']}}&Owner={{_filters['sales_activities_engagement.user_full_name']}}"
    #}
  }


  measure: Total_Opportunity_Value{
    type: sum_distinct
    sql_distinct_key: ${TABLE}.OpportunityId ;;
    sql: ${TABLE}.OpportunityExpectedValue ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.OpportunityProbability ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.OpportunityStageName ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.ActivityStatus ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.Subject ;;
  }

  dimension: task_priority {
    type: string
    sql: ${TABLE}.TaskPriority ;;
  }

  dimension: account_country {
    type: string
    sql: ${TABLE}.AccountBillingCountry ;;
  }

 dimension: lead_id {
   type:string
  sql: ${TABLE}.LeadId  ;;
 }


  dimension_group: lead_created_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.LeadCreatedDatestamp ;;
  }

  dimension: lead_owner_id {
    type: string
    sql:${TABLE}.LeadOwnerId ;;
  }

dimension: lead_owner {
  type: string
  sql: ${TABLE}.LeadOwnerName ;;
}

dimension: lead_country {
  type: string
  sql: ${TABLE}.LeadCountry ;;
}

dimension: lead_status {
  type: string
  sql: ${TABLE}.LeadStatus ;;
}

dimension: lead_industry {
  type: string
  sql: ${TABLE}.LeadIndustry ;;
}


#measure: count_lead_owner {
#  type: count_distinct
#  sql: ${TABLE}.LeadOwnerId ;;
#}

#Lead activity

  measure: count_lead_id {
    type: count_distinct
    filters: [lead_id: "-NULL",opportunity_id: "NULL"]
    sql: ${TABLE}.LeadId ;;
    value_format: "#,##0"
  }

  measure: count_lead_activity {
    type: count_distinct
    filters: [lead_id: "-NULL",opportunity_id: "NULL"]
    sql: ${TABLE}.ActivityId ;;
    value_format: "#,##0"
  }

  measure: count_lead_owner {
    type: count_distinct
    filters: [lead_id: "-NULL",opportunity_id: "NULL"]
    sql: ${TABLE}.LeadOwnerId ;;
    value_format: "#,##0"
  }


  measure: activity_per_lead {
    type: number
    sql: ${count_lead_activity}/NULLIF(${count_lead_id},0) ;;
    value_format: "0.00"
     link: {
       label: "Lead Follow-Ups Detail Report"
       url: "/dashboards/cortex_infosys::sales_activities__engagement_lead_followups_details?Lead+Created+Date={{_filters['sales_activities_engagement.lead_created_date_date'] | url_encode}}&Lead+Country={{_filters['sales_activities_engagement.lead_country']}}&Lead+Industry={{_filters['sales_activities_engagement.lead_industry']}}&Lead+Status={{_filters['sales_activities_engagement.lead_status']}}&Lead+Owner={{_filters['sales_activities_engagement.lead_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Lead+Is+Converted+(Yes+/+No)={{_filters['sales_activities_engagement.is_converted'] | url_encode}}
"
     }
  }

  measure: activity_per_lead_owner {
    type: number
    sql: ${count_lead_activity}/NULLIF(${count_lead_owner},0) ;;
    value_format: "#,##0"
    link: {
      label: "Lead Follow-Ups Detail Report"
      url: "/dashboards/cortex_infosys::sales_activities__engagement_lead_followups_details?Lead+Created+Date={{_filters['sales_activities_engagement.lead_created_date_date'] | url_encode}}&Lead+Country={{_filters['sales_activities_engagement.lead_country']}}&Lead+Industry={{_filters['sales_activities_engagement.lead_industry']}}&Lead+Status={{_filters['sales_activities_engagement.lead_status']}}&Lead+Owner={{_filters['sales_activities_engagement.lead_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Lead+Is+Converted+(Yes+/+No)={{_filters['sales_activities_engagement.is_converted'] | url_encode}}
"
    }
  }



#Unqualified Leads

  measure: activities_unqualified_leads {
    type: count_distinct
    filters: [lead_status :"Unqualified",lead_id: "-NULL",opportunity_id: "NULL"]
    sql: ${TABLE}.ActivityId ;;

  }

  measure: count_unqualified_leads {
    type: count_distinct
    filters: [lead_status: "Unqualified",lead_id: "-NULL",opportunity_id: "NULL"]
    sql: ${TABLE}.LeadId ;;
  }

  measure: activities_per_unqualified_leads {
    type: number
    sql: ${activities_unqualified_leads}/NULLIF(${count_unqualified_leads},0);;
    value_format:"0.00"
    link: {
      label: "Lead Follow-Ups Detail Report"
      url: "/dashboards/cortex_infosys::sales_activities__engagement_lead_followups_details?Lead+Created+Date={{_filters['sales_activities_engagement.lead_created_date_date'] | url_encode}}&Lead+Country={{_filters['sales_activities_engagement.lead_country']}}&Lead+Industry={{_filters['sales_activities_engagement.lead_industry']}}&Lead+Status={{_filters['sales_activities_engagement.lead_status']}}&Lead+Owner={{_filters['sales_activities_engagement.lead_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Lead+Is+Converted+(Yes+/+No)={{_filters['sales_activities_engagement.is_converted'] | url_encode}}
      "
    }
  }


#Converted Leads

  measure: activities_converted_leads {
    type: count_distinct
    filters: [is_converted: "Yes",lead_id: "-NULL",opportunity_id: "NULL"]
    sql: ${TABLE}.ActivityId ;;

  }

  measure: count_converted_leads {
    type: count_distinct
    filters: [is_converted: "Yes",lead_id: "-NULL",opportunity_id: "NULL"]
    sql: ${TABLE}.LeadId ;;
  }

  measure: activities_per_converted_leads {
    type: number
    sql: ${activities_converted_leads}/NULLIF(${count_converted_leads},0);;
    value_format:"0.00"
    link: {
      label: "Lead Follow-Ups Detail Report"
      url: "/dashboards/cortex_infosys::sales_activities__engagement_lead_followups_details?Lead+Created+Date={{_filters['sales_activities_engagement.lead_created_date_date'] | url_encode}}&Lead+Country={{_filters['sales_activities_engagement.lead_country']}}&Lead+Industry={{_filters['sales_activities_engagement.lead_industry']}}&Lead+Status={{_filters['sales_activities_engagement.lead_status']}}&Lead+Owner={{_filters['sales_activities_engagement.lead_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Lead+Is+Converted+(Yes+/+No)={{_filters['sales_activities_engagement.is_converted'] | url_encode}}
"
    }
  }

#Opportunity Activity

  measure: count_opportunity_activity {
    type: count_distinct
    filters: [opportunity_id: "-NULL"]
    sql: ${TABLE}.ActivityId ;;
    value_format: "#,##0"
  }


  measure: count_opportunity_id {
    type: count_distinct
    sql: ${TABLE}.OpportunityId ;;
    value_format: "#,##0"
  }

  measure: count_opportunity_owner {
    type: count_distinct
    sql: ${TABLE}.OpportunityOwnerId ;;
    value_format: "#,##0"
  }

  measure: activity_per_opportunity {
    type: number
    sql: ${count_opportunity_activity}/NULLIF(${count_opportunity_id},0);;
    value_format:"0"
  }

  measure: activity_per_opportunity_owner {
    type: number
    sql: ${count_opportunity_activity}/NULLIF(${count_opportunity_owner},0) ;;
    value_format: "#,##0"
    link: {
      label: "Opportunity Activities Detail Report"
      url: "/dashboards/cortex_infosys::sales_activities__engagement_opportunity_activities_details?Opportunity+Created+Date={{_filters['sales_activities_engagement.opportunity_created_date'] | url_encode}}&Country={{_filters['sales_activities_engagement.account_country']}}&Industry={{_filters['sales_activities_engagement.account_industry']}}&Stage={{_filters['sales_activities_engagement.stage_name']}}&Opportunity+Owner={{_filters['sales_activities_engagement.opportunity_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Opportunity+Is+Closed+(Yes+/+No)={{_filters['sales_activities_engagement.is_closed'] | url_encode}}&Opportunity+Is+Won+(Yes+/+No)={{_filters['sales_activities_engagement.is_won'] | url_encode}}"
    }
  }

#Open opportunities
  measure: activities_open_opportunities {
    type: count_distinct
    filters: [is_closed_flag: "No"]
    sql: ${TABLE}.ActivityId ;;
  }


  measure: count_open_opportunities {
    type: count_distinct
    filters: [is_closed_flag: "No"]
    sql: ${TABLE}.OpportunityId ;;

  }


  measure: activity_per_open_opportunity {
    type: number
    sql: ${activities_open_opportunities}/NULLIF(${count_open_opportunities},0) ;;
    value_format: "0"
    link: {
      label: "Opportunity Activities Detail Report"
      url: "/dashboards/cortex_infosys::sales_activities__engagement_opportunity_activities_details?Opportunity+Created+Date={{_filters['sales_activities_engagement.opportunity_created_date'] | url_encode}}&Country={{_filters['sales_activities_engagement.account_country']}}&Industry={{_filters['sales_activities_engagement.account_industry']}}&Stage={{_filters['sales_activities_engagement.stage_name']}}&Opportunity+Owner={{_filters['sales_activities_engagement.opportunity_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Opportunity+Is+Closed+(Yes+/+No)={{_filters['sales_activities_engagement.is_closed'] | url_encode}}&Opportunity+Is+Won+(Yes+/+No)={{_filters['sales_activities_engagement.is_won'] | url_encode}}"
    }
  }

#Closed Opportunities
  measure: activities_closed_opportunities {
    type: count_distinct
    filters: [is_closed_flag: "Yes"]
    sql: ${TABLE}.ActivityId ;;
  }


  measure: count_closed_opportunities {
    type: count_distinct
    filters: [is_closed_flag: "Yes"]
    sql: ${TABLE}.OpportunityId ;;

  }

  measure: activity_per_closed_opportunity {
    type: number
    sql: ${activities_closed_opportunities}/NULLIF(${count_closed_opportunities},0) ;;
    value_format: "0"
    link: {
      label: "Opportunity Activities Detail Report"
      url: "/dashboards/cortex_infosys::sales_activities__engagement_opportunity_activities_details?Opportunity+Created+Date={{_filters['sales_activities_engagement.opportunity_created_date'] | url_encode}}&Country={{_filters['sales_activities_engagement.account_country']}}&Industry={{_filters['sales_activities_engagement.account_industry']}}&Stage={{_filters['sales_activities_engagement.stage_name']}}&Opportunity+Owner={{_filters['sales_activities_engagement.opportunity_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Opportunity+Is+Closed+(Yes+/+No)={{_filters['sales_activities_engagement.is_closed'] | url_encode}}&Opportunity+Is+Won+(Yes+/+No)={{_filters['sales_activities_engagement.is_won'] | url_encode}}"
    }
  }

#Closed-Won Opportunities

  measure: activities_closed_won_opportunities {
    type: count_distinct
    filters: [is_closed_flag: "Yes",is_won_flag: "Yes"]
    sql: ${TABLE}.ActivityId ;;
  }


  measure: count_closed_won_opportunities {
    type: count_distinct
    filters: [is_closed_flag: "Yes",is_won_flag: "Yes"]
    sql: ${TABLE}.OpportunityId ;;

  }

  measure: activity_per_closed_won_opportunity {
    type: number
    sql: ${activities_closed_won_opportunities}/NULLIF(${count_closed_won_opportunities},0) ;;
    value_format: "0"
    link: {
      label: "Opportunity Activities Detail Report"
      url: "/dashboards/cortex_infosys::sales_activities__engagement_opportunity_activities_details?Opportunity+Created+Date={{_filters['sales_activities_engagement.opportunity_created_date'] | url_encode}}&Country={{_filters['sales_activities_engagement.account_country']}}&Industry={{_filters['sales_activities_engagement.account_industry']}}&Stage={{_filters['sales_activities_engagement.stage_name']}}&Opportunity+Owner={{_filters['sales_activities_engagement.opportunity_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Opportunity+Is+Closed+(Yes+/+No)={{_filters['sales_activities_engagement.is_closed'] | url_encode}}&Opportunity+Is+Won+(Yes+/+No)={{_filters['sales_activities_engagement.is_won'] | url_encode}}"
    }
  }

  #Closed-Lost Opportunities

  measure: activities_closed_lost_opportunities {
    type: count_distinct
    filters: [is_closed_flag: "Yes",is_won_flag: "No"]
    sql: ${TABLE}.ActivityId ;;
  }


  measure: count_closed_lost_opportunities {
    type: count_distinct
    filters: [is_closed_flag: "Yes",is_won_flag: "No"]
    sql: ${TABLE}.OpportunityId ;;

  }

  measure: activity_per_closed_lost_opportunity {
    type: number
    sql: ${activities_closed_lost_opportunities}/NULLIF(${count_closed_lost_opportunities},0) ;;
    value_format: "0"
    link: {
      label: "Opportunity Activities Detail Report"
      url: "/dashboards/cortex_infosys::sales_activities__engagement_opportunity_activities_details?Opportunity+Created+Date={{_filters['sales_activities_engagement.opportunity_created_date'] | url_encode}}&Country={{_filters['sales_activities_engagement.account_country']}}&Industry={{_filters['sales_activities_engagement.account_industry']}}&Stage={{_filters['sales_activities_engagement.stage_name']}}&Opportunity+Owner={{_filters['sales_activities_engagement.opportunity_owner']}}&Activity+Status={{_filters['sales_activities_engagement.status']}}&Opportunity+Is+Closed+(Yes+/+No)={{_filters['sales_activities_engagement.is_closed'] | url_encode}}&Opportunity+Is+Won+(Yes+/+No)={{_filters['sales_activities_engagement.is_won'] | url_encode}}"
    }
  }

  dimension: sales_rep_owner {
    type: string
    sql:  CASE
         WHEN ${opportunity_id} IS NOT NULL THEN ${TABLE}.OpportunityOwnerName
         WHEN ${lead_id} IS NOT NULL AND ${opportunity_id} IS NULL THEN ${TABLE}.LeadOwnerName
         ELSE ${TABLE}.ActivityOwnerName
       END;;
  }

  dimension: sales_rep_owner_id {
    type: string
    sql:  CASE
         WHEN ${opportunity_id} IS NOT NULL THEN ${TABLE}.OpportunityOwnerId
         WHEN ${lead_id} IS NOT NULL AND ${opportunity_id} IS NULL THEN ${TABLE}.LeadOwnerId
         ELSE ${TABLE}.OwnerId
       END;;
  }

  dimension: account_lead_country {
    type: string
    sql:  CASE
         WHEN ${opportunity_id} IS NOT NULL THEN ${TABLE}.AccountBillingCountry
         WHEN ${lead_id} IS NOT NULL AND ${opportunity_id} IS NULL THEN ${TABLE}.LeadCountry
         ELSE ${TABLE}.AccountBillingCountry
       END;;
  }

  dimension: account_lead_industry {
    type: string
    sql:  CASE
         WHEN ${opportunity_id} IS NOT NULL THEN ${TABLE}.AccountIndustry
         WHEN ${lead_id} IS NOT NULL AND ${opportunity_id} IS NULL THEN ${TABLE}.LeadIndustry
         ELSE ${TABLE}.AccountIndustry
       END;;
  }

  dimension_group: lead_opportunity_created_date{
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql:  CASE
         WHEN ${opportunity_id} IS NOT NULL THEN ${TABLE}.OpportunityCreatedDatestamp
         WHEN ${lead_id} IS NOT NULL AND ${opportunity_id} IS NULL THEN ${TABLE}.LeadCreatedDatestamp
         ELSE ${TABLE}.ActivityCreatedDatestamp
       END;;
  }


dimension: what_id {
  type:string
  sql: ${TABLE}.WhatId ;;
}


  measure: dash_nav {
    hidden: no
    label: "Navigation Bar"
    type: string
    sql: "";;
    html:
    <div style="background-color: #FFFFFF; height:525px;width:100%"></div>
      <div style="background-color: #FFFFFF; border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; height: 60px; width:100%">
        <nav style="font-size: 18px; color: #4285F4">
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_infosys::leads_capture__conversion" target=”_blank”>Leads Capture And Conversion</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_infosys::opportunity_trends__pipeline" target=”_blank”>Opportunity Trends And Pipeline</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_infosys::sales_activities__engagement" target=”_blank”>Sales Activities And Engagement</a>
        </nav>
        </nav>
      </div>
    <div style="background-color: #FFFFFF; height:500px;width:100%"></div>;;
  }

#
  measure: count {
    type: count
    drill_fields: [stage_name, opportunity_name, lead_name, account_name]
  }
}