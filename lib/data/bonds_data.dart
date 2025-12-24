import '../models/bond_model.dart';

final List<BondModel> bondsList = [
  BondModel(
    name: "Government Bond",
    amount: 10000,
    interest: 7.2,
    tenure: 5,
    status: "Active",
    rating: "CRISIL AAA",
    issuer: "Government of India",
    ipoDate: "15 Jan 2025",
    pros: [
      "Very low risk",
      "Government backed security",
      "Stable returns",
    ],
    cons: [
      "Lower returns compared to corporate bonds",
      "Long lock-in period",
    ],
  ),
  BondModel(
    name: "Corporate Bond",
    amount: 25000,
    interest: 9.5,
    tenure: 3,
    status: "Upcoming",
    rating: "CRISIL AA+",
    issuer: "ABC Finance Ltd",
    ipoDate: "02 Feb 2025",
    pros: [
      "Higher interest rate",
      "Shorter tenure",
    ],
    cons: [
      "Moderate credit risk",
      "Depends on issuer performance",
    ],
  ),
];
