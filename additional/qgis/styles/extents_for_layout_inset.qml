<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" simplifyAlgorithm="0" readOnly="0" simplifyDrawingTol="1" version="3.6.0-Noosa" maxScale="0" simplifyMaxScale="1" styleCategories="AllStyleCategories" simplifyDrawingHints="1" minScale="1e+08" hasScaleBasedVisibilityFlag="0" labelsEnabled="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" type="RuleRenderer" forceraster="0" enableorderby="0">
    <rules key="{3c8d05d9-e958-4239-b575-949d65da2585}">
      <rule filter="&quot;group_id&quot; = @atlas_featureid " key="{bf80d65d-9b9e-4fe3-8812-0853be7b2f4f}" symbol="0"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" name="0" type="fill" force_rhr="0">
        <layer class="SimpleFill" pass="0" enabled="1" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="188,0,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="188,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
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
  <layerOpacity>0.666</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory penAlpha="255" lineSizeType="MM" backgroundAlpha="255" height="15" labelPlacementMethod="XHeight" sizeType="MM" sizeScale="3x:0,0,0,0,0,0" width="15" scaleDependency="Area" penWidth="0" lineSizeScale="3x:0,0,0,0,0,0" backgroundColor="#ffffff" rotationOffset="270" diagramOrientation="Up" minScaleDenominator="0" minimumSize="0" scaleBasedVisibility="0" enabled="0" opacity="1" maxScaleDenominator="1e+08" penColor="#000000" barWidth="5">
      <fontProperties description="MS Shell Dlg 2,8.1,-1,5,50,0,0,0,0,0" style=""/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="18" zIndex="0" placement="1" dist="0" priority="0" showAll="1" obstacle="0">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="group_id">
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
    <field name="mode_filter">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="group_id" name="" index="0"/>
    <alias field="batch_item_id" name="" index="1"/>
    <alias field="mode_filter" name="" index="2"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="group_id" applyOnUpdate="0" expression=""/>
    <default field="batch_item_id" applyOnUpdate="0" expression=""/>
    <default field="mode_filter" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" exp_strength="0" field="group_id" constraints="3"/>
    <constraint notnull_strength="1" unique_strength="0" exp_strength="0" field="batch_item_id" constraints="1"/>
    <constraint notnull_strength="1" unique_strength="0" exp_strength="0" field="mode_filter" constraints="1"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="group_id" desc=""/>
    <constraint exp="" field="batch_item_id" desc=""/>
    <constraint exp="" field="mode_filter" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" name="batch_item_id" type="field" width="-1"/>
      <column hidden="0" name="group_id" type="field" width="-1"/>
      <column hidden="0" name="mode_filter" type="field" width="-1"/>
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
    <field name="batch_item_id" editable="1"/>
    <field name="batch_run_id" editable="1"/>
    <field name="group_id" editable="1"/>
    <field name="home_health_decile" editable="1"/>
    <field name="mode_filter" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="batch_item_id" labelOnTop="0"/>
    <field name="batch_run_id" labelOnTop="0"/>
    <field name="group_id" labelOnTop="0"/>
    <field name="home_health_decile" labelOnTop="0"/>
    <field name="mode_filter" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>batch_run_id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
