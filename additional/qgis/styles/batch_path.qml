<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="1" simplifyAlgorithm="0" simplifyDrawingTol="1" version="3.6.0-Noosa" readOnly="0" maxScale="0" labelsEnabled="0" minScale="1e+08" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" simplifyMaxScale="1" styleCategories="AllStyleCategories">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="1" type="RuleRenderer" enableorderby="0" forceraster="0">
    <rules key="{c236a628-af95-4a0d-be23-66973c2e36e0}">
      <rule label="Active" key="{116ce421-2bb2-430c-ab0d-bf58cb473072}" filter=" &quot;sub_mode_filter&quot; IN (3,4,5) AND  @atlas_featureid =  &quot;group_id&quot; " symbol="0"/>
      <rule label="Inactive" key="{59b50994-1a9b-48b4-bbe3-33c761662f73}" filter=" &quot;sub_mode_filter&quot; IN (1,2,6) AND  @atlas_featureid =  &quot;group_id&quot; " symbol="1"/>
    </rules>
    <symbols>
      <symbol alpha="0.8" force_rhr="0" type="line" clip_to_extent="1" name="0">
        <layer pass="0" locked="0" enabled="1" class="MarkerLine">
          <prop k="interval" v="2.2"/>
          <prop k="interval_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="interval_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_along_line" v="0"/>
          <prop k="offset_along_line_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_along_line_unit" v="MM"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="placement" v="interval"/>
          <prop k="ring_filter" v="0"/>
          <prop k="rotate" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" force_rhr="0" type="marker" clip_to_extent="1" name="@0@0">
            <layer pass="0" locked="0" enabled="1" class="SimpleMarker">
              <prop k="angle" v="0"/>
              <prop k="color" v="215,25,28,255"/>
              <prop k="horizontal_anchor_point" v="1"/>
              <prop k="joinstyle" v="bevel"/>
              <prop k="name" v="circle"/>
              <prop k="offset" v="0,0"/>
              <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="offset_unit" v="MM"/>
              <prop k="outline_color" v="0,0,0,255"/>
              <prop k="outline_style" v="solid"/>
              <prop k="outline_width" v="0.4"/>
              <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="outline_width_unit" v="MM"/>
              <prop k="scale_method" v="diameter"/>
              <prop k="size" v="0.76"/>
              <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
              <prop k="size_unit" v="MM"/>
              <prop k="vertical_anchor_point" v="1"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol alpha="0.8" force_rhr="0" type="line" clip_to_extent="1" name="1">
        <layer pass="0" locked="0" enabled="1" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="44,123,182,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory opacity="1" rotationOffset="270" penColor="#000000" sizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" lineSizeType="MM" barWidth="5" minScaleDenominator="0" lineSizeScale="3x:0,0,0,0,0,0" penWidth="0" sizeType="MM" penAlpha="255" enabled="0" backgroundAlpha="255" backgroundColor="#ffffff" diagramOrientation="Up" height="15" minimumSize="0" labelPlacementMethod="XHeight" width="15" maxScaleDenominator="1e+08" scaleDependency="Area">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="18" dist="0" placement="2" priority="0" zIndex="0" showAll="1" obstacle="0">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="batch_run_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="batch_item_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="group_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sub_group_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="mode_filter">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sub_mode_filter">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" index="0" name=""/>
    <alias field="batch_run_id" index="1" name=""/>
    <alias field="batch_item_id" index="2" name=""/>
    <alias field="group_id" index="3" name=""/>
    <alias field="sub_group_id" index="4" name=""/>
    <alias field="mode_filter" index="5" name=""/>
    <alias field="sub_mode_filter" index="6" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="id" expression=""/>
    <default applyOnUpdate="0" field="batch_run_id" expression=""/>
    <default applyOnUpdate="0" field="batch_item_id" expression=""/>
    <default applyOnUpdate="0" field="group_id" expression=""/>
    <default applyOnUpdate="0" field="sub_group_id" expression=""/>
    <default applyOnUpdate="0" field="mode_filter" expression=""/>
    <default applyOnUpdate="0" field="sub_mode_filter" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" field="id" exp_strength="0" constraints="3" unique_strength="1"/>
    <constraint notnull_strength="0" field="batch_run_id" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="batch_item_id" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="group_id" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="sub_group_id" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="mode_filter" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="sub_mode_filter" exp_strength="0" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="batch_run_id" exp=""/>
    <constraint desc="" field="batch_item_id" exp=""/>
    <constraint desc="" field="group_id" exp=""/>
    <constraint desc="" field="sub_group_id" exp=""/>
    <constraint desc="" field="mode_filter" exp=""/>
    <constraint desc="" field="sub_mode_filter" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" type="field" width="-1" name="id"/>
      <column hidden="0" type="field" width="-1" name="batch_run_id"/>
      <column hidden="0" type="field" width="-1" name="batch_item_id"/>
      <column hidden="0" type="field" width="-1" name="group_id"/>
      <column hidden="0" type="field" width="-1" name="sub_group_id"/>
      <column hidden="0" type="field" width="-1" name="mode_filter"/>
      <column hidden="0" type="field" width="-1" name="sub_mode_filter"/>
      <column hidden="1" type="actions" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="batch_item_id"/>
    <field editable="1" name="batch_run_id"/>
    <field editable="1" name="group_id"/>
    <field editable="1" name="id"/>
    <field editable="1" name="mode_filter"/>
    <field editable="1" name="sub_group_id"/>
    <field editable="1" name="sub_mode_filter"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="batch_item_id"/>
    <field labelOnTop="0" name="batch_run_id"/>
    <field labelOnTop="0" name="group_id"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="mode_filter"/>
    <field labelOnTop="0" name="sub_group_id"/>
    <field labelOnTop="0" name="sub_mode_filter"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
