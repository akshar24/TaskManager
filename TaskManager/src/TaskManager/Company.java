package TaskManager;

import javax.persistence.*;

//Declaring class Company as hibernate Entity (available to map to table)
@Entity (name="companies")
public class Company {
	// defining created table (from entity) as "companies"
	// company will be our Id (first search param)
	@Id
	private String company;
	private String companyId;
	private String companyPhone;
	private String companyDesc;
	private String companyAddress;

	public Company(String company, String companyId, String companyPhone, String companyDesc, String companyAddress) {
		this.company = company;
		this.companyId = companyId;
		this.companyPhone = companyPhone;
		this.companyDesc = companyDesc;
		this.companyAddress = companyAddress;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyPhone() {
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}

	public String getCompanyDesc() {
		return companyDesc;
	}

	public void setCompanyDesc(String companyDesc) {
		this.companyDesc = companyDesc;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

}
