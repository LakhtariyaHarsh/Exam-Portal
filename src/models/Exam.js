const mongoose = require("mongoose");

const ExamSchema = new mongoose.Schema({
    examCategory: [{ type: mongoose.Schema.Types.ObjectId, ref: "Category" }],
    name: { type: String, required: true },
    postDate: Date,
    updateDate: Date,
    shortInformation: String,
    organizationName: String,
    fullNameOfExam: String,
    advertisementNo: String,
    applicationBegin: Date,
    lastDateToApply: Date,
    lastDateToPayExamFee: Date,
    examDate: Date,
    isadmitCardAvailable: Boolean,
    admitCardAvailable: Date,
    admitCardAvailableEdit: Date,
    generalCategoryFee: Number,
    obcCategoryFee: Number,
    ewsCategoryFee: Number,
    scstCategoryFee: Number,
    phCategoryFee: Number,
    womenCategoryFee: Number,
    howToPay: String,
    minAge: Number,
    maxAge: Number,
    ageRelaxationBrief: String,
    ageFrom: Date,
    ageUpto: Date,
    multiPost: Boolean,
    postDetails: [{ type: mongoose.Schema.Types.ObjectId, ref: "Post" }],
    applyOnline: String,
    shortNotice: Boolean,
    downloadShortNotice: String,
    downloadNotification: String,
    officialWebsite: String,
    eligibilityCriteria: [{ type: mongoose.Schema.Types.ObjectId, ref: "Eligibility" }],
    downloadBroucher: Boolean,
    broucherLink: String,
    syllabusAvailable: Boolean,
    syllabusAvailableDate: Date,
    resultAvailable: Boolean,
    resultPostingDate: Date,
    resultPostModify: Date,
    resultlink: String,
    howToCheckResult: String,
    howToFillForm: String,
    howToDownloadAdmitCard: String,
    correctionInForm: Boolean,
    correctionInFormLink: String,
    correctiondateInForm: Date,
    jobPostingDate: Date
});

module.exports = mongoose.model("Exam", ExamSchema);
