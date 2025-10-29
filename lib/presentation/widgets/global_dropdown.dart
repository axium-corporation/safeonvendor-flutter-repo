import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

/// Branch model
class Branch {
  final String id;
  final String name;

  Branch({required this.id, required this.name});
}

/// Reusable Branch Dropdown Widget
class BranchDropdown extends StatefulWidget {
  final List<Branch> branches;
  final Function(String branchId)? onBranchSelected; // callback

  const BranchDropdown({
    super.key,
    required this.branches,
    this.onBranchSelected,
  });

  @override
  State<BranchDropdown> createState() => _BranchDropdownState();
}

class _BranchDropdownState extends State<BranchDropdown> {
  Branch? selectedBranch;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<Branch>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
      hint: const Text('Select Branch', style: TextStyle(fontSize: 16)),
      items: widget.branches
          .map(
            (branch) => DropdownMenuItem(
              value: branch,
              child: Text(branch.name, style: const TextStyle(fontSize: 16)),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select a branch';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          selectedBranch = value;
        });
        if (value != null && widget.onBranchSelected != null) {
          widget.onBranchSelected!(value.id); // return only ID
        }
      },
      onSaved: (value) {
        selectedBranch = value;
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
