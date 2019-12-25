package authority.domain;


/**
 * <!-- begin-user-doc -->
 * <!--  end-user-doc  -->
 * @generated
 */

public class Actor
{
	public Actor(int id, String no, String name) {
		this.id = id;
		this.no = no;
		this.name = name;
//		this.user = user;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!--  end-user-doc  -->
	 * @generated
	 * @ordered
	 */
	
	private int id;

	/**
	 * <!-- begin-user-doc -->
	 * <!--  end-user-doc  -->
	 * @generated
	 * @ordered
	 */
	
	private String no;

	/**
	 * <!-- begin-user-doc -->
	 * <!--  end-user-doc  -->
	 * @generated
	 * @ordered
	 */
	
	private String name;

	public int getId() {
		return id;
	}

	public String getNo() {
		return no;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public void setName(String name) {
		this.name = name;
	}

//	public void setUser(User user) {
//		this.user = user;
//	}

	public String getName() {
		return name;
	}

//	public User getUser() {
//		return user;
//	}

	/**
	 * <!-- begin-user-doc -->
	 * <!--  end-user-doc  -->
	 * @generated
	 * @ordered
	 */
	
//	private User user;

	/**
	 * <!-- begin-user-doc -->
	 * <!--  end-user-doc  -->
	 * @generated
	 */
	public Actor(){
		super();
	}

}

