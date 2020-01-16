<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+08" simplifyAlgorithm="0" simplifyMaxScale="1" version="3.6.0-Noosa" readOnly="0" maxScale="0" styleCategories="AllStyleCategories" labelsEnabled="0" simplifyDrawingTol="1" simplifyDrawingHints="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="1" type="RuleRenderer" enableorderby="0">
    <rules key="{c236a628-af95-4a0d-be23-66973c2e36e0}">
      <rule label="Active" key="{116ce421-2bb2-430c-ab0d-bf58cb473072}" filter=" &quot;sub_mode_filter&quot; IN (3,4,5) AND  @atlas_featureid =  &quot;group_id&quot; " symbol="0"/>
      <rule label="Inactive" key="{59b50994-1a9b-48b4-bbe3-33c761662f73}" filter=" &quot;sub_mode_filter&quot; IN (1,2,6) AND  @atlas_featureid =  &quot;group_id&quot; " symbol="1"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" clip_to_extent="1" type="line" name="0" alpha="0.8">
        <layer class="MarkerLine" enabled="1" pass="0" locked="0">
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
          <symbol force_rhr="0" clip_to_extent="1" type="marker" name="@0@0" alpha="1">
            <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
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
      <symbol force_rhr="0" clip_to_extent="1" type="line" name="1" alpha="0.8">
        <layer class="SimpleLine" enabled="1" pass="0" locked="0">
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
    <DiagramCategory minimumSize="0" penColor="#000000" backgroundColor="#ffffff" scaleDependency="Area" labelPlacementMethod="XHeight" sizeType="MM" opacity="1" maxScaleDenominator="1e+08" width="15" enabled="0" height="15" lineSizeType="MM" penWidth="0" scaleBasedVisibility="0" lineSizeScale="3x:0,0,0,0,0,0" rotationOffset="270" barWidth="5" diagramOrientation="Up" penAlpha="255" sizeScale="3x:0,0,0,0,0,0" minScaleDenominator="0" backgroundAlpha="255">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" priority="0" linePlacementFlags="18" showAll="1" placement="2" obstacle="0" zIndex="0">
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
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="batch_run_id" expression="" applyOnUpdate="0"/>
    <default field="batch_item_id" expression="" applyOnUpdate="0"/>
    <default field="group_id" expression="" applyOnUpdate="0"/>
    <default field="sub_group_id" expression="" applyOnUpdate="0"/>
    <default field="mode_filter" expression="" applyOnUpdate="0"/>
    <default field="sub_mode_filter" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" field="id" constraints="3" notnull_strength="1" unique_strength="1"/>
    <constraint exp_strength="0" field="batch_run_id" constraints="0" notnull_strength="0" unique_strength="0"/>
    <constraint exp_strength="0" field="batch_item_id" constraints="0" notnull_strength="0" unique_strength="0"/>
    <constraint exp_strength="0" field="group_id" constraints="0" notnull_strength="0" unique_strength="0"/>
    <constraint exp_strength="0" field="sub_group_id" constraints="0" notnull_strength="0" unique_strength="0"/>
    <constraint exp_strength="0" field="mode_filter" constraints="0" notnull_strength="0" unique_strength="0"/>
    <constraint exp_strength="0" field="sub_mode_filter" constraints="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" desc="" exp=""/>
    <constraint field="batch_run_id" desc="" exp=""/>
    <constraint field="batch_item_id" desc="" exp=""/>
    <constraint field="group_id" desc="" exp=""/>
    <constraint field="sub_group_id" desc="" exp=""/>
    <constraint field="mode_filter" desc="" exp=""/>
    <constraint field="sub_mode_filter" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column width="-1" type="field" hidden="0" name="id"/>
      <column width="-1" type="field" hidden="0" name="batch_run_id"/>
      <column width="-1" type="field" hidden="0" name="batch_item_id"/>
      <column width="-1" type="field" hidden="0" name="group_id"/>
      <column width="-1" type="field" hidden="0" name="sub_group_id"/>
      <column width="-1" type="field" hidden="0" name="mode_filter"/>
      <column width="-1" type="field" hidden="0" name="sub_mode_filter"/>
      <column width="-1" type="actions" hidden="1"/>
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
