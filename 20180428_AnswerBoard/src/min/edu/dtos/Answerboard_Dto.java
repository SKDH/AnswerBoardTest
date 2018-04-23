package min.edu.dtos;

public class Answerboard_Dto {
	private int SEQ;
	private String ID;
	private String TITLE;
	private String CONTENT;
	private int PASSWORD;
	private int REF;
	private int STEP;
	private int DEPTH;
	private int READCOUNT;
	private String REGDATE;

	public Answerboard_Dto(int sEQ, String iD, String tITLE, String cONTENT, int pASSWORD, int rEF, int sTEP, int dEPTH,
			int rEADCOUNT, String rEGDATE) {
		this.SEQ = sEQ;
		this.ID = iD;
		this.TITLE = tITLE;
		this.CONTENT = cONTENT;
		this.PASSWORD = pASSWORD;
		this.REF = rEF;
		this.STEP = sTEP;
		this.DEPTH = dEPTH;
		this.READCOUNT = rEADCOUNT;
		this.REGDATE = rEGDATE;
	}

	public Answerboard_Dto() {
	}

	public int getSEQ() {
		return SEQ;
	}

	public void setSEQ(int sEQ) {
		SEQ = sEQ;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}

	public int getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(int pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public int getREF() {
		return REF;
	}

	public void setREF(int rEF) {
		REF = rEF;
	}

	public int getSTEP() {
		return STEP;
	}

	public void setSTEP(int sTEP) {
		STEP = sTEP;
	}

	public int getDEPTH() {
		return DEPTH;
	}

	public void setDEPTH(int dEPTH) {
		DEPTH = dEPTH;
	}

	public int getREADCOUNT() {
		return READCOUNT;
	}

	public void setREADCOUNT(int rEADCOUNT) {
		READCOUNT = rEADCOUNT;
	}

	public String getREGDATE() {
		return REGDATE;
	}

	public void setREGDATE(String rEGDATE) {
		REGDATE = rEGDATE;
	}

	@Override
	public String toString() {
		return "Answerboard_Dto [SEQ=" + SEQ + ", ID=" + ID + ", TITLE=" + TITLE + ", CONTENT=" + CONTENT
				+ ", PASSWORD=" + PASSWORD + ", REF=" + REF + ", STEP=" + STEP + ", DEPTH=" + DEPTH + ", READCOUNT="
				+ READCOUNT + ", REGDATE=" + REGDATE + "]";
	}
}
