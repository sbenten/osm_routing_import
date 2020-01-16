<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" version="3.6.3-Noosa" labelsEnabled="0" readOnly="0" styleCategories="AllStyleCategories" simplifyDrawingTol="1" simplifyDrawingHints="1" simplifyLocal="1" simplifyMaxScale="1" minScale="1e+08" simplifyAlgorithm="0" hasScaleBasedVisibilityFlag="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="RuleRenderer" enableorderby="0">
    <rules key="{3322389f-6cf0-47b4-9658-da6a2ace264f}">
      <rule symbol="0" filter=" &quot;sub_mode_filter&quot;  IN (1,2,5,6) AND &quot;group_id&quot; = @atlas_featureid " label="Inactive" key="{9777ccc4-eaf7-49a9-bf63-02ad7a622757}"/>
      <rule symbol="1" filter=" &quot;sub_mode_filter&quot;  IN (3,4) AND &quot;group_id&quot; = @atlas_featureid " label="Active" key="{d30bba41-7261-4ad0-9d96-d83c554c1c6f}"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" type="line" force_rhr="0" name="0" alpha="0.8">
        <layer pass="0" class="SimpleLine" locked="0" enabled="1">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="37,52,109,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.66"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineWidth">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="1" type="int" name="type"/>
                  <Option value="" type="QString" name="val"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="line" force_rhr="0" name="1" alpha="1">
        <layer pass="0" class="SimpleLine" locked="0" enabled="1">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="35,132,67,255"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="0.96"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property value="id" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>5</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory opacity="1" minScaleDenominator="0" rotationOffset="270" penAlpha="255" width="15" scaleDependency="Area" lineSizeScale="3x:0,0,0,0,0,0" enabled="0" minimumSize="0" sizeScale="3x:0,0,0,0,0,0" sizeType="MM" backgroundAlpha="255" maxScaleDenominator="1e+08" diagramOrientation="Up" scaleBasedVisibility="0" barWidth="5" labelPlacementMethod="XHeight" backgroundColor="#ffffff" lineSizeType="MM" penWidth="0" height="15" penColor="#000000">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute field="" label="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" zIndex="0" priority="0" placement="2" obstacle="0" linePlacementFlags="18">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option name="properties"/>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
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
    <alias field="mode_filter" index="4" name=""/>
    <alias field="sub_mode_filter" index="5" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="batch_run_id" expression="" applyOnUpdate="0"/>
    <default field="batch_item_id" expression="" applyOnUpdate="0"/>
    <default field="group_id" expression="" applyOnUpdate="0"/>
    <default field="mode_filter" expression="" applyOnUpdate="0"/>
    <default field="sub_mode_filter" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" notnull_strength="1" exp_strength="0" constraints="3" unique_strength="1"/>
    <constraint field="batch_run_id" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="batch_item_id" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="group_id" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="mode_filter" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint field="sub_mode_filter" notnull_strength="0" exp_strength="0" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" desc="" exp=""/>
    <constraint field="batch_run_id" desc="" exp=""/>
    <constraint field="batch_item_id" desc="" exp=""/>
    <constraint field="group_id" desc="" exp=""/>
    <constraint field="mode_filter" desc="" exp=""/>
    <constraint field="sub_mode_filter" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" type="field" name="id" hidden="0"/>
      <column width="-1" type="field" name="batch_run_id" hidden="0"/>
      <column width="-1" type="field" name="batch_item_id" hidden="0"/>
      <column width="-1" type="field" name="group_id" hidden="0"/>
      <column width="-1" type="field" name="mode_filter" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" type="field" name="sub_mode_filter" hidden="0"/>
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
    <field editable="1" name="bike_count"/>
    <field editable="1" name="count"/>
    <field editable="1" name="group_id"/>
    <field editable="1" name="home_health_decile"/>
    <field editable="1" name="id"/>
    <field editable="1" name="mode_filter"/>
    <field editable="1" name="sub_group_id"/>
    <field editable="1" name="sub_mode_filter"/>
    <field editable="1" name="walk_count"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="batch_item_id"/>
    <field labelOnTop="0" name="batch_run_id"/>
    <field labelOnTop="0" name="bike_count"/>
    <field labelOnTop="0" name="count"/>
    <field labelOnTop="0" name="group_id"/>
    <field labelOnTop="0" name="home_health_decile"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="mode_filter"/>
    <field labelOnTop="0" name="sub_group_id"/>
    <field labelOnTop="0" name="sub_mode_filter"/>
    <field labelOnTop="0" name="walk_count"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
