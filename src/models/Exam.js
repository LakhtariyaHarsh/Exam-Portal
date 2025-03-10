const mongoose = require("mongoose");

const ExamSchema = new mongoose.Schema({
    examCategory: { type: mongoose.Schema.ObjectId, ref: "Category" },
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
    isanswerKeyAvailable: Boolean,
    answerKeyAvailable: Date,
    answerKeyAvailableEdit: Date,
    iscertificateVerificationAvailable: Boolean,
    certificateVerificationAvailable: Date,
    isImportant: Boolean,
    important: Date,
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
    postDetails: [
        {
            postName: { type: String, required: true },
               totalPost: Number,
               generalPost: Number,
               obcPost: Number,
               ewsPost: Number,
               scPost: Number,
               stPost: Number,
               eligiblityDetails: { type: mongoose.Schema.ObjectId, ref: "Eligibility" },
        },
    ],
    applyOnline: String,
    shortNotice: Boolean,
    downloadShortNotice: String,
    downloadNotification: String,
    officialWebsite: String,
    eligibilityCriteria: { type: mongoose.Schema.ObjectId, ref: "Eligibility" },
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
    jobPostingDate: Date,
    tileName: String,
    DashboardName: String
}, { timestamps: true });

module.exports = mongoose.model("Exam", ExamSchema);
