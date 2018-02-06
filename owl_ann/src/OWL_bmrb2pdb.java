/*
    BMRBoTool - Ontology tool for NMR-STAR data
    Copyright 2013-2018 Masashi Yokochi
    
    https://github.com/yokochi47/BMRBxTool

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 */

import java.util.HashMap;

public class OWL_bmrb2pdb {

	public static HashMap<String, String> bmrb2pdb = null;

	OWL_bmrb2pdb() {

		bmrb2pdb = new HashMap<String, String>();

		bmrb2pdb.put("atom.pdb_asym_id", "atom_site.label_asym_id");
		bmrb2pdb.put("atom.pdb_atom_id", "atom_site.label_atom_id");
		bmrb2pdb.put("atom.pdb_atom_type", "atom_site.type_symbol");
		bmrb2pdb.put("atom.pdb_comp_id", "atom_site.label_comp_id");
		bmrb2pdb.put("atom.pdb_group", "atom_site.group_PDB");
		bmrb2pdb.put("atom.pdb_ins_code", "atom_site.pdbx_PDB_ins_code");
		bmrb2pdb.put("atom.pdb_one_letter_code", "chem_comp.one_letter_code");
		bmrb2pdb.put("atom.pdb_seq_id", "atom_site.pdbx_PDB_residue_no");
		bmrb2pdb.put("atom.pdb_strand_id", "atom_site.pdbx_PDB_strand_id");

		bmrb2pdb.put("atom_site.pdb_atom_name", "atom_site.pdbx_PDB_atom_name");
		bmrb2pdb.put("atom_site.pdb_ins_code", "atom_site.pdbx_PDB_ins_code");
		bmrb2pdb.put("atom_site.pdb_model_num", "atom_site.pdbx_PDB_model_num");
		bmrb2pdb.put("atom_site.pdb_record_id", "atom_site.id");
		bmrb2pdb.put("atom_site.pdb_residue_name", "atom_site.pdbx_PDB_residue_name");
		bmrb2pdb.put("atom_site.pdb_residue_no", "atom_site.pdbx_PDB_residue_no");
		bmrb2pdb.put("atom_site.pdb_strand_id", "atom_site.pdbx_PDB_strand_id");
		bmrb2pdb.put("atom_site.pdbx_formal_charge", "atom_site.pdbx_formal_charge");
		bmrb2pdb.put("atom_site.pdbx_label_asym_id", "atom_site.label_asym_id");
		bmrb2pdb.put("atom_site.pdbx_label_atom_id", "atom_site.label_atom_id");
		bmrb2pdb.put("atom_site.pdbx_label_comp_id", "atom_site.label_comp_id");
		bmrb2pdb.put("atom_site.pdbx_label_entity_id", "atom_site.label_entity_id");
		bmrb2pdb.put("atom_site.pdbx_label_seq_id", "atom_site.label_seq_id");

		bmrb2pdb.put("chem_comp.pdb_code", "chem_comp.id");
		bmrb2pdb.put("chem_comp.std_deriv_pdb_code", "chem_comp.pdbx_model_coordinates_db_code");

		bmrb2pdb.put("chem_comp_atom.pdb_atom_id", "chem_comp_atom.atom_id");
		bmrb2pdb.put("chem_comp_atom.pdbx_ordinal", "chem_comp_atom.pdbx_ordinal");

		bmrb2pdb.put("citation_author.pdbx_name", "citation_author.name");
		bmrb2pdb.put("citation_editor.pdbx_name", "citation_editor.name");

		bmrb2pdb.put("conformer_family_coord_set.constraints_pdb_file_id", "pdbx_nmr_constraint_file.constraint_filename");
		bmrb2pdb.put("conformer_family_coord_set.pdb_accession_code", "entry.id");

		bmrb2pdb.put("entity_assembly.pdb_chain_id", "struct_asym.id");

		bmrb2pdb.put("entity_experimental_src.pdbview_host_org_vector_name", "entity_src_gen.pdbx_host_org_vector");
		bmrb2pdb.put("entity_experimental_src.pdbview_plasmid_name", "entity_src_gen.pdbx_gene_src_plasmid_name");

		bmrb2pdb.put("entry.assigned_pdb_id", "entry.id");

		bmrb2pdb.put("entry_author.pdbx_name", "audit_author.name");

		bmrb2pdb.put("gen_dist_constraint.pdb_atom_name_1", "geom_contact.atom_site_label_atom_id_1");
		bmrb2pdb.put("gen_dist_constraint.pdb_atom_name_2", "geom_contact.atom_site_label_atom_id_2");
		bmrb2pdb.put("gen_dist_constraint.pdb_ins_code_1", "geom_contact.pdbx_atom_site_PDB_ins_code_1");
		bmrb2pdb.put("gen_dist_constraint.pdb_ins_code_2", "geom_contact.pdbx_atom_site_PDB_ins_code_2");
		bmrb2pdb.put("gen_dist_constraint.pdb_model_num_1", "geom_contact.pdbx_PDB_model_num");
		bmrb2pdb.put("gen_dist_constraint.pdb_model_num_2", "geom_contact.pdbx_PDB_model_num");
		bmrb2pdb.put("gen_dist_constraint.pdb_record_id_1", "geom_contact.atom_site_id_1");
		bmrb2pdb.put("gen_dist_constraint.pdb_record_id_2", "geom_contact.atom_site_id_2");
		bmrb2pdb.put("gen_dist_constraint.pdb_residue_name_1", "geom_contact.atom_site_label_comp_id_1");
		bmrb2pdb.put("gen_dist_constraint.pdb_residue_name_2", "geom_contact.atom_site_label_comp_id_2");
		bmrb2pdb.put("gen_dist_constraint.pdb_residue_no_1", "geom_contact.atom_site_label_seq_id_1");
		bmrb2pdb.put("gen_dist_constraint.pdb_residue_no_2", "geom_contact.atom_site_label_seq_id_2");
		bmrb2pdb.put("gen_dist_constraint.pdb_strand_id_1", "geom_contact.atom_site_label_asym_id_1");
		bmrb2pdb.put("gen_dist_constraint.pdb_strand_id_2", "geom_contact.atom_site_label_asym_id_2");

		bmrb2pdb.put("pb_char.pdb_ins_code", "atom_site.pdbx_PDB_ins_code");
		bmrb2pdb.put("pb_char.pdb_model_num", "atom_site.pdbx_PDB_model_num");
		bmrb2pdb.put("pb_char.pdb_residue_name", "atom_site.pdbx_PDB_residue_name");
		bmrb2pdb.put("pb_char.pdb_residue_no", "atom_site.pdbx_PDB_residue_no");
		bmrb2pdb.put("pb_char.pdb_strand_id", "atom_site.pdbx_PDB_strand_id");

		bmrb2pdb.put("pb_list.pdb_id", "entry.id");
		bmrb2pdb.put("pb_list.pdbx_exptl_method", "exptl.method");
		bmrb2pdb.put("pb_list.pdbx_nmr_refine_method", "pdbx_nmr_refine.method");
		bmrb2pdb.put("pb_list.pdbx_refine_ls_d_res_high", "refine.ls_d_res_high");
		bmrb2pdb.put("pb_list.pdbx_refine_ls_d_res_low", "refine.ls_d_res_low");
		bmrb2pdb.put("pb_list.pdbx_refine_ls_r_factor_r_free", "refine.ls_R_factor_R_free");
		bmrb2pdb.put("pb_list.pdbx_refine_ls_r_factor_r_work", "refine.ls_R_factor_R_work");

		bmrb2pdb.put("pdbx_nonpoly_scheme.pdb_ins_code", "pdbx_nonpoly_scheme.pdb_ins_code");
		bmrb2pdb.put("pdbx_nonpoly_scheme.pdb_mon_id", "pdbx_nonpoly_scheme.pdb_mon_id");
		bmrb2pdb.put("pdbx_nonpoly_scheme.pdb_seq_num", "pdbx_nonpoly_scheme.pdb_seq_num");
		bmrb2pdb.put("pdbx_nonpoly_scheme.pdb_strand_id", "pdbx_nonpoly_scheme.pdb_strand_id");

		bmrb2pdb.put("pdbx_poly_seq_scheme.pdb_chain_id", "pdbx_poly_seq_scheme.pdb_strand_id");
		bmrb2pdb.put("pdbx_poly_seq_scheme.pdb_ins_code", "pdbx_poly_seq_scheme.pdb_ins_code");
		bmrb2pdb.put("pdbx_poly_seq_scheme.pdb_mon_id", "pdbx_poly_seq_scheme.pdb_mon_id");
		bmrb2pdb.put("pdbx_poly_seq_scheme.pdb_seq_num", "pdbx_poly_seq_scheme.ndb_seq_num");

		bmrb2pdb.put("rdc_constraint.pdb_atom_name_1", "");
		bmrb2pdb.put("rdc_constraint.pdb_atom_name_2", "");
		bmrb2pdb.put("rdc_constraint.pdb_ins_code_1", "");
		bmrb2pdb.put("rdc_constraint.pdb_ins_code_2", "");
		bmrb2pdb.put("rdc_constraint.pdb_model_num_1", "");
		bmrb2pdb.put("rdc_constraint.pdb_model_num_2", "");
		bmrb2pdb.put("rdc_constraint.pdb_record_id_1", "");
		bmrb2pdb.put("rdc_constraint.pdb_record_id_2", "");
		bmrb2pdb.put("rdc_constraint.pdb_residue_name_1", "");
		bmrb2pdb.put("rdc_constraint.pdb_residue_name_2", "");
		bmrb2pdb.put("rdc_constraint.pdb_residue_no_1", "");
		bmrb2pdb.put("rdc_constraint.pdb_residue_no_2", "");
		bmrb2pdb.put("rdc_constraint.pdb_strand_id_1", "");
		bmrb2pdb.put("rdc_constraint.pdb_strand_id_2", "");

		bmrb2pdb.put("rep_conf.chem_comp_pdb_id_code", "chem_comp.id");

		bmrb2pdb.put("representative_conformer.pdb_accession_code", "entry.id");

		bmrb2pdb.put("struct_anno_char.pdb_strand_id", "atom_site.pdbx_PDB_strand_id");

		bmrb2pdb.put("struct_asym.pdbx_blank_pdb_chainid_flag", "struct_asym.pdbx_blank_PDB_chainid_flag");
		bmrb2pdb.put("struct_asym.pdbx_modified", "struct_asym.pdbx_modified");

		bmrb2pdb.put("structure_annotation.pdb_id", "entry.id");

		bmrb2pdb.put("torsion_angle_constraint.pdb_atom_name_1", "geom_torsion.atom_site_label_atom_id_1");
		bmrb2pdb.put("torsion_angle_constraint.pdb_atom_name_2", "geom_torsion.atom_site_label_atom_id_2");
		bmrb2pdb.put("torsion_angle_constraint.pdb_atom_name_3", "geom_torsion.atom_site_label_atom_id_3");
		bmrb2pdb.put("torsion_angle_constraint.pdb_atom_name_4", "geom_torsion.atom_site_label_atom_id_4");
		bmrb2pdb.put("torsion_angle_constraint.pdb_ins_code_1", "geom_torsion.pdbx_atom_site_PDB_ins_code_1");
		bmrb2pdb.put("torsion_angle_constraint.pdb_ins_code_2", "geom_torsion.pdbx_atom_site_PDB_ins_code_2");
		bmrb2pdb.put("torsion_angle_constraint.pdb_ins_code_3", "geom_torsion.pdbx_atom_site_PDB_ins_code_3");
		bmrb2pdb.put("torsion_angle_constraint.pdb_ins_code_4", "geom_torsion.pdbx_atom_site_PDB_ins_code_4");
		bmrb2pdb.put("torsion_angle_constraint.pdb_model_num_1", "geom_torsion.pdbx_PDB_model_num");
		bmrb2pdb.put("torsion_angle_constraint.pdb_model_num_2", "geom_torsion.pdbx_PDB_model_num");
		bmrb2pdb.put("torsion_angle_constraint.pdb_model_num_3", "geom_torsion.pdbx_PDB_model_num");
		bmrb2pdb.put("torsion_angle_constraint.pdb_model_num_4", "geom_torsion.pdbx_PDB_model_num");
		bmrb2pdb.put("torsion_angle_constraint.pdb_record_id_1", "geom_torsion.atom_site_id_1");
		bmrb2pdb.put("torsion_angle_constraint.pdb_record_id_2", "geom_torsion.atom_site_id_2");
		bmrb2pdb.put("torsion_angle_constraint.pdb_record_id_3", "geom_torsion.atom_site_id_3");
		bmrb2pdb.put("torsion_angle_constraint.pdb_record_id_4", "geom_torsion.atom_site_id_4");
		bmrb2pdb.put("torsion_angle_constraint.pdb_residue_name_1", "geom_torsion.atom_site_label_comp_id_1");
		bmrb2pdb.put("torsion_angle_constraint.pdb_residue_name_2", "geom_torsion.atom_site_label_comp_id_2");
		bmrb2pdb.put("torsion_angle_constraint.pdb_residue_name_3", "geom_torsion.atom_site_label_comp_id_3");
		bmrb2pdb.put("torsion_angle_constraint.pdb_residue_name_4", "geom_torsion.atom_site_label_comp_id_4");
		bmrb2pdb.put("torsion_angle_constraint.pdb_residue_no_1", "geom_torsion.atom_site_label_seq_id_1");
		bmrb2pdb.put("torsion_angle_constraint.pdb_residue_no_2", "geom_torsion.atom_site_label_seq_id_2");
		bmrb2pdb.put("torsion_angle_constraint.pdb_residue_no_3", "geom_torsion.atom_site_label_seq_id_3");
		bmrb2pdb.put("torsion_angle_constraint.pdb_residue_no_4", "geom_torsion.atom_site_label_seq_id_4");
		bmrb2pdb.put("torsion_angle_constraint.pdb_strand_id_1", "geom_torsion.atom_site_label_asym_id_1");
		bmrb2pdb.put("torsion_angle_constraint.pdb_strand_id_2", "geom_torsion.atom_site_label_asym_id_2");
		bmrb2pdb.put("torsion_angle_constraint.pdb_strand_id_3", "geom_torsion.atom_site_label_asym_id_3");
		bmrb2pdb.put("torsion_angle_constraint.pdb_strand_id_4", "geom_torsion.atom_site_label_asym_id_4");

	}

	public String convert(String bmrb_tag) {
		return bmrb2pdb.get(bmrb_tag);
	}

}