package com.defa.model.core;

import java.util.List;


public class Role {
    private Integer roleId;

    private String roleName;

    private String description;

    private Integer status;
    
    private Integer[] rightId;

    public Integer[] getRightId() {
		return rightId;
	}

	public void setRightId(Integer[] rightId) {
		this.rightId = rightId;
	}

	private List<Right> rights;

    public List<Right> getRights() {
		return rights;
	}

	public void setRights(List<Right> rights) {
		this.rights = rights;
	}
	
    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}