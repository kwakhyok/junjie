package cn.com.agilemaster

import org.springframework.context.MessageSourceResolvable

/**
 * Activity
 * A domain class describes the data object and it's mapping to the database
 */
class Activity {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated
    User user
    TaskPlan taskPlan

    String tag
    String description

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping


    static mapping = {

    }

    static constraints = {
        tag size: 1..20, inList: ["意愿","参建","投标","专家"]
        description size: 1..100, nullable: true
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${organization?.name} is doing ${task?.title} in the way of  ${description}";
	}
}

public enum ActivityCategory{

    PARTICIPATION("Participation"), BID("Bid"), SPECIALIST("Specialist"), DESIGN("Design"),INTENTION("Intention")

    final String value

    ActivityCategory(String value){
        this.value = value
    }
}
