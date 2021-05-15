package edu.hebeu.entity;

public class overtimestatistics {
    private Integer empid;
    private String name;
    private Integer counts;
    private String depname;

    @Override
    public String toString() {
        return "overtimestatistics{" +
                "empid=" + empid +
                ", name='" + name + '\'' +
                ", counts=" + counts +
                ", depname='" + depname + '\'' +
                '}';
    }

    public void setCounts(Integer counts) {
        this.counts = counts;
    }

    public String getDepname() {
        return depname;
    }

    public void setDepname(String depname) {
        this.depname = depname;
    }

    public overtimestatistics() {
    }

    public Integer getEmpid() {
        return empid;
    }

    public void setEmpid(Integer empid) {
        this.empid = empid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCounts() {
        return counts;
    }

    public void setCounts(int counts) {
        this.counts = counts;
    }

}
