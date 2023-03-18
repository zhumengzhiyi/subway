package com.Bean;

public class Bean1 {
int ID;
String name;
String nol;
@Override
public String toString() {
	return "Bean1 [ID=" + ID + ", name=" + name + ", nol=" + nol + ", getID()=" + getID() + ", getName()=" + getName()
			+ ", getNol()=" + getNol() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
			+ super.toString() + "]";
}
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getNol() {
	return nol;
}
public void setNol(String nol) {
	this.nol = nol;
}

}
